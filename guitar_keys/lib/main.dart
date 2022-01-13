import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guitar Keys',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Guitar Keys'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//Column Selector Array
Map NoteKeys = {
  "A♭": ["A♭", "B♭m", "Cm", "D♭", "E♭", "Fm", "Gdim"],
  "A": ["A", "Bm", "C♯m", "D", "E", "F♯m", "G♯dim"],
  "B♭": ["B♭", "Cm", "Dm", "E♭", "F", "Gm", "Adim"],
  "B": ["B", "C♯m", "D♯m", "E", "F♯", "G♯m", "A♯dim"],
  "C": ["C", "Dm", "Em", "F", "G", "Am", "Bdim"],
  "C♯": ["C♯", "D♯m", "E♯m", "F♯", "G♯", "A♯m", "B♯dim"],
  "D♭": ["D♭", "E♭m", "Fm", "G♭", "A♭", "B♭m", "Cdim"],
  "D": ["D", "Em", "F♯m", "G", "A", "Bm", "C♯dim"],
  "E♭": ["E♭", "Fm", "Gm", "A♭", "B♭", "Cm", "Ddim"],
  "E": ["E", "F♯m", "G♯m", "A", "B", "C♯m", "D♯dim"],
  "F": ["F", "Gm", "Am", "B♭", "C", "Dm", "Edim"],
  "F♯": ["F♯", "G♯m", "A♯m", "B", "C♯", "D♯m", "E♯dim"],
  "G♭": ["G♭", "A♭m", "B♭m", "C♭", "D♭", "E♭m", "Fdim"],
  "G": ["G", "Am", "Bm", "C", "D", "Em", "F♯dim"],
};
var Notes = {
  "A♭",
  "A",
  "B♭",
  "B",
  "C",
  "C♯",
  "D♭",
  "D",
  "E♭",
  "E",
  "F",
  "F♯",
  "G♭",
  "G"
};

String currentNote = Notes.elementAt(0).toString();
List currentList = NoteKeys[currentNote];
List NoteNumber = ["I", "ii", "iii", "IV", "V", "vi", "vii"];
int selected = 0;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.blueGrey,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 6,
                child: ListView.builder(
                    itemCount: Notes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TextButton(
                        style: ButtonStyle(
                          backgroundColor: (index == selected)
                              ? MaterialStateProperty.all(
                                  Colors.grey.shade200,
                                )
                              : MaterialStateProperty.all(Colors.blueGrey),
                        ),
                        child: Text(
                          Notes.elementAt(index).toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          setState(() {
                            currentNote = Notes.elementAt(index).toString();
                            currentList = NoteKeys[currentNote];
                            selected = index;
                          });
                        },
                      );
                    }),
              ),
              Container(
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width / 3,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: currentList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide())),
                            height: 50,
                            child: Center(
                              child: Text(currentList[index]),
                            ));
                      }),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width / 3,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: NoteNumber.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide())),
                            height: 50,
                            child: Center(
                              child: Text(NoteNumber[index].toString()),
                            ));
                      }),
                )
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
