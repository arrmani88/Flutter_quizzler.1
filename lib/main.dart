import 'quizz.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Inside(),
      ),
    ),
  );
}

Icon retTrueIcon() {
  return Icon(
    Icons.check,
    color: Colors.green,
  );
}

Icon retFalseIcon() {
  return Icon(
    Icons.close,
    color: Colors.red,
  );
}

Widget retSzBox() {
  return SizedBox(
    height: 25.0,
  );
}

class Inside extends StatefulWidget {
  @override
  _InsideState createState() => _InsideState();
}

Quizz quizz = Quizz();

class _InsideState extends State<Inside> {
  void giveNextQuestion({bool usrAnsw}) {
    setState(() {
      if (quizz.retAnswer() == usrAnsw) {
        score.add(retTrueIcon());
      } else {
        score.add(retFalseIcon());
      }
      quizz.getNextItem();
      if (quizz.itemNb == quizz.listLen()) {
        Alert(
            context: context,
            title: "CONGRATS",
            desc: "You finished the Quizz.",
            buttons: [
              DialogButton(
                  child: Text('Restart the quizz'), onPressed: () => Navigator.pop(context),)
            ]).show();
        quizz.resetItemIndex();
        score.clear();
        score = [retSzBox()];
      }
    });
  }

  List<Widget> score = [retSzBox()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    quizz.retQuestion(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: FlatButton(
                color: Colors.green,
                height: 80.0,
                onPressed: () {
                  giveNextQuestion(usrAnsw: true);
                },
                child: Center(
                  child: Text(
                    'True',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: FlatButton(
                color: Colors.red,
                height: 80.0,
                onPressed: () {
                  giveNextQuestion(usrAnsw: false);
                },
                child: Center(
                  child: Text(
                    'False',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: score,
            ),
            SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
