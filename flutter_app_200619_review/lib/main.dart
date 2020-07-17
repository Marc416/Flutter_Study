import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(Test());
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "REview",
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }

}

class RandomWordsState extends State<RandomWords> {

  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Start up"),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
//    final WordPair wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder:(BuildContext _context, int i ){
        if(i.isOdd)
          return new Divider();

        final int index = i~/2;

        if(index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }

}
