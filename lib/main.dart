import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _current = 0;
  Duration _current = Duration(seconds: 0);

  void startTimer(int minute) {
    Duration _start = new Duration(minutes: minute);
    CountdownTimer timer = new CountdownTimer(
      _start,
      new Duration(seconds: 1),
    );
    var sub = timer.listen(null);

    sub.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed;
      });
    });

    sub.onDone(() {
      sub.cancel();
    });
  }

  String get timerString {
    return '${_current.inMinutes}:${(_current.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(timerString,
              style: TextStyle(fontSize:62.0,
              color: const Color(0xFF000000),
              fontWeight: FontWeight.w600,
              fontFamily: "Roboto"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(key: null,
                    onPressed: () {
                      startTimer(3);
                    },
                    color: const Color(0xFFe0e0e0),
                    child:
                      Text(
                        "3分",
                        style: TextStyle(fontSize:12.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                      )
                ),
                RaisedButton(key:null,
                  onPressed: () {
                    startTimer(4);
                  },
                  color: const Color(0xFFe0e0e0),
                  child:
                    Text(
                      "4分",
                      style: TextStyle(fontSize:12.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                    )
                ),
                RaisedButton(key:null,
                  onPressed: () {
                    startTimer(5);
                  },
                  color: const Color(0xFFe0e0e0),
                  child:
                    Text(
                      "5分",
                      style: TextStyle(fontSize:12.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                    )
                )
              ]
            ),
        ]
      ),
      )
    );
  }
}