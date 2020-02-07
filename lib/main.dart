import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _status = "Pode entrar!!";

  void _atualizaQtdPessoas(int qtd) {
    setState(() {
      _people += qtd;
      if (_people > 10) {
        _status = "Lotado!!";
      } else if (_people < 0) {
        _status = "Mundo invertido?!";
      } else {
        _status = "Pode entrar!!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    onPressed: () {
                      _atualizaQtdPessoas(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    onPressed: () {
                      _atualizaQtdPessoas(-1);
                    },
                  ),
                ),
              ],
            ),
            Text("$_status",
                style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0)),
          ],
        )
      ],
    );
  }
}
