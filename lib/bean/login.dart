class LoginBean {
  int timestamp;
  int code;
  String message;
  Data data;

  LoginBean({this.timestamp, this.code, this.data});

  LoginBean.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String token;
  UserProfile userProfile;

  Data({this.token, this.userProfile});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userProfile = json['user_profile'] != null
        ? new UserProfile.fromJson(json['user_profile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.userProfile != null) {
      data['user_profile'] = this.userProfile.toJson();
    }
    return data;
  }
}

class UserProfile {
  int id;
  String name;
  List<String> namePinyin;
  String countryCode;
  String avatarFid;
  String mobile;
  String mobileLocal;
  int usage;
  bool weixinAuth;
  bool qqAuth;
  bool gioneeAuth;
  String estimateGender;
  int estimatedMediaNum;
  int membership;
  int vipLevel;
  String vipDesc;
  String createdAt;
  int daysFromCreated;
  int trashShowDays;
  int maxFileSize;
  int clusterThreshold;
  String memberAdUrl;

  UserProfile(
      {this.id,
      this.name,
      this.namePinyin,
      this.countryCode,
      this.avatarFid,
      this.mobile,
      this.mobileLocal,
      this.usage,
      this.weixinAuth,
      this.qqAuth,
      this.gioneeAuth,
      this.estimateGender,
      this.estimatedMediaNum,
      this.membership,
      this.vipLevel,
      this.vipDesc,
      this.createdAt,
      this.daysFromCreated,
      this.trashShowDays,
      this.maxFileSize,
      this.clusterThreshold,
      this.memberAdUrl});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    namePinyin = json['name_pinyin'].cast<String>();
    countryCode = json['country_code'];
    avatarFid = json['avatar_fid'];
    mobile = json['mobile'];
    mobileLocal = json['mobile_local'];
    usage = json['usage'];
    weixinAuth = json['weixin_auth'];
    qqAuth = json['qq_auth'];
    gioneeAuth = json['gionee_auth'];
    estimateGender = json['estimate_gender'];
    estimatedMediaNum = json['estimated_media_num'];
    membership = json['membership'];
    vipLevel = json['vip_level'];
    vipDesc = json['vip_desc'];
    createdAt = json['created_at'];
    daysFromCreated = json['days_from_created'];
    trashShowDays = json['trash_show_days'];
    maxFileSize = json['max_file_size'];
    clusterThreshold = json['cluster_threshold'];
    memberAdUrl = json['member_ad_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_pinyin'] = this.namePinyin;
    data['country_code'] = this.countryCode;
    data['avatar_fid'] = this.avatarFid;
    data['mobile'] = this.mobile;
    data['mobile_local'] = this.mobileLocal;
    data['usage'] = this.usage;
    data['weixin_auth'] = this.weixinAuth;
    data['qq_auth'] = this.qqAuth;
    data['gionee_auth'] = this.gioneeAuth;
    data['estimate_gender'] = this.estimateGender;
    data['estimated_media_num'] = this.estimatedMediaNum;
    data['membership'] = this.membership;
    data['vip_level'] = this.vipLevel;
    data['vip_desc'] = this.vipDesc;
    data['created_at'] = this.createdAt;
    data['days_from_created'] = this.daysFromCreated;
    data['trash_show_days'] = this.trashShowDays;
    data['max_file_size'] = this.maxFileSize;
    data['cluster_threshold'] = this.clusterThreshold;
    data['member_ad_url'] = this.memberAdUrl;
    return data;
  }
}
