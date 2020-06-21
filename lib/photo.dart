import 'dart:convert' as convert;
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'bean/login.dart';
import 'bean/photo.dart';
import 'bean/setting.dart';

class PhotoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PhotoState();
  }
}

class ImgBean {
  String originalUrl;
  String avatarUrl;
  String url;
  String token;
  String md5;
  String sourcePath;
}

class PhotoState extends State<PhotoWidget> {
  TextStyle style = TextStyle(fontSize: 16);

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _title = 'Login';
  bool _login = false;
  String _token = '';

  UriTemplate urlTemplates;
  List photos = new List<ImgBean>();
  String prev = '';
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    _prefs.then((prefs) {
      _login = prefs.getBool('_login') ?? false;
      _title = prefs.getString('_title') ?? (_login ? 'Photo' : 'Login');
      _token = prefs.getString('_token') ?? null;
      setState(() {});
      if (_login && _token.isNotEmpty) {
        doFetch();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.photo), onPressed: _todo()),
        ],
      ),
      body: _makeBody(),
    );
  }

  _makeBody() {
    if (this._login) {
      return ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: photos.length,
          itemBuilder: (context, i) {
            if (i >= photos.length) {
              if (hasMore) {
                doFetch();
              } else {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: const Text('No More Photos'),
                  action: null,
                ));
              }
            }
            return _buildRow(i, photos[i]);
          });
    } else {
      return LoginWidget(
        login: _login,
        onLoginChanged: this.onLoginChanged,
      );
    }
  }

  Widget _buildRow(int i, ImgBean img) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: CachedNetworkImage(
          imageUrl: img.url,
          httpHeaders: {'authorization': 'Bearer $_token'},
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ));
  }

  void onLoginChanged(bool login, String token) async {
    print('onLoginChanged: $login - $token');
    if (_login) {
      doInit();
      doFetch();
    }

    if (_login != login) {
      setState(() {
        _login = login;
        _title = _login ? 'Photos' : 'Login';
        _token = token;
      });
      _prefs.then((p) {
        p.setBool('_login', _login);
        p.setString('_title', _title);
        p.setString('_token', _token);
      });
    }
  }

  _todo() {}

  final settingsUrl = 'https://api.everphoto.cn/application/settings';
  final photoUrl = 'https://web.everphoto.cn/api/users/self/updates?count=200';

  Future<UriTemplate> doInit() async {
    var settingsRes = await http
        .get(settingsUrl, headers: {'authorization': 'Bearer $_token'});
    print('settingsUrl Response status: ${settingsRes.statusCode}');
    var setRes = SettingBean.fromJson(convert.jsonDecode(settingsRes.body));

    if (settingsRes.statusCode != HttpStatus.ok || setRes.code != 0) {
      print(
          'req settingsUrl failed: ${settingsRes.statusCode}, ${setRes.code}');
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(setRes.message),
        action: null,
      ));
    } else {
      // ok
      urlTemplates = setRes.data.uriTemplate;
    }
    return urlTemplates;
  }

  void doFetch() async {
//    SharedPreferences sp = await _prefs;
//    String prev = sp.getString('_prev');

    var response = await http.get(
        prev.isEmpty ? photoUrl : photoUrl + '&p=$prev',
        headers: {'authorization': 'Bearer $_token'});
    print('photoUrl Response status: ${response.statusCode}');
    var res = PhotoBean.fromJson(convert.jsonDecode(response.body));

    if (response.statusCode != HttpStatus.ok || res.code != 0) {
      print('req photoUrl failed: ${response.statusCode}, ${res.code}');
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(res.message),
        action: null,
      ));
    } else {
      // ok
      prev = res.pagination.prev;
      hasMore = res.pagination.hasMore;
      if (urlTemplates == null) {
        urlTemplates = await doInit();
      }
      List<MediaList> mediaList = res.data.mediaList;
      String mediaId = '<media_id>';
      for (MediaList m in mediaList) {
        print('found img: $m.id - ${m.sourcePath}');
        var bean = ImgBean();
        bean.url = urlTemplates.p1080.replaceAll(mediaId, '${m.id}');
        bean.avatarUrl = urlTemplates.avatar.replaceAll(mediaId, '${m.id}');
        bean.originalUrl = urlTemplates.origin.replaceAll(mediaId, '${m.id}');
        bean.token = m.token;
        bean.md5 = m.md5;
        bean.sourcePath = m.sourcePath;
        photos.add(bean);
        setState(() {});
      }
    }
  }
}

class LoginWidget extends StatefulWidget {
  var onLoginChanged;
  var login;

  LoginWidget({Key key, this.login: false, @required this.onLoginChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginWidget> {
  final formKey = GlobalKey<FormState>();
  String _name, _pass;

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();

      print("_submit click");
      print("_name: " + _name + " _pass: " + _pass);
      // do login
      _dologin(_name, _pass);
    }
  }

  void _dologin(String name, String pass) async {
    final mobile = "+86" + name;
    pass = 'tc.everphoto.' + pass;
    var content = convert.Utf8Codec().encode(pass);
    var digest = md5.convert(content);
    final password = hex.encode(digest.bytes);

    final url = 'https://web.everphoto.cn/api/auth';

    final param = 'mobile=$mobile&password=$password';
    print(param);
    var response = await http.post(url, body: param);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    final rep = convert.jsonDecode(response.body);
    final login = LoginBean.fromJson(rep);
    if (login.code != 0) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(login.message),
        action: null,
      ));
    } else {
      setState(() {
        print('setState - login token: ${login.data.token}');
        widget.login = true;
        widget.onLoginChanged(true, login.data.token);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.phone,
            validator: (value) =>
                value.length != 11 ? 'Not a valid phone num.' : null,
            onSaved: (val) => _name = val,
            decoration: const InputDecoration(
              hintText: 'Enter your num',
              labelText: 'Number',
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            validator: (value) => value.length < 6 ? 'length too short' : null,
            onSaved: (val) => _pass = val,
            decoration: const InputDecoration(
              hintText: 'password',
              labelText: 'password',
            ),
          ),
          RaisedButton(
            onPressed: _submit,
            child: Text('Login'),
          ),
        ],
      ),
    ));
  }
}
