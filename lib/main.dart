import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(FtApp());

class FtApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    return MaterialApp(title: 'FtApp', home: RandomWords());
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
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
        appBar: AppBar(title: Text('ListView')),
        body: _buildSuggestions(),
      );

  Widget _buildRow(int i, WordPair words) => ListTile(
        title: Text(
          i.toString() + "  " + words.asPascalCase,
          style: _biggerFont,
        ),
      );
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RandomWordsState();
}
