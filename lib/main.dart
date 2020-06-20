import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(FtApp());

class FtApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    return MaterialApp(
      title: 'FtApp',
      home: RandomWords(),
      theme: new ThemeData(primaryColor: Colors.white),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  Widget _buildSuggestions() {
    return ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) return Divider();

      final index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(index, _suggestions[index]);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
          actions: <Widget>[
            new IconButton(
                icon: const Icon(Icons.list), onPressed: _gotoSaveList)
          ],
        ),
        body: _buildSuggestions(),
      );

  Widget _buildRow(int i, WordPair words) {
    final bool saved = _saved.contains(words);
    return ListTile(
      title: Text(
        i.toString() + "  " + words.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        saved ? Icons.favorite : Icons.favorite_border,
        color: saved ? Colors.red[300] : null,
      ),
      onTap: () {
        setState(() {
          if (saved) {
            _saved.remove(words);
          } else {
            _saved.add(words);
          }
        });
      },
    );
  }

  void _gotoSaveList() {
    Navigator.of(context)
        .push(new MaterialPageRoute<void>(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _saved.map((e) => new ListTile(
            title: new Text(
              e.asPascalCase,
              style: _biggerFont,
            ),
          ));
      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();
      return new Scaffold(
        appBar: new AppBar(
          title: const Text('Favourite'),
        ),
        body: new ListView(children: divided),
      );
    }));
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RandomWordsState();
}
