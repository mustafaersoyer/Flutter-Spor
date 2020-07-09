import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../services/networking.dart';

class Sozluk extends StatefulWidget {
  @override
  _SozlukState createState() => _SozlukState();
}

class _SozlukState extends State<Sozluk> {
  @override
  void initState() {
    super.initState();
  }

  final myController = TextEditingController();
  var text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Türkçe İngilizce Sözlük'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            child: TextField(
              onChanged: (text) {
                this.text = text;
              },
              decoration: InputDecoration(
                hintText: 'Türkçe Kelime Yazın',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          FlatButton(
            color: Colors.teal,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.tealAccent,
            onPressed: () {
              /*...*/
              getData();
            },
            child: Text(
              "Ara",
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),
    );
  }

  var data;
  Future<void> getData() async {
    NetworkHelper networkHelper = NetworkHelper(
        "https://www.netdata.com/JSON/d495b07c?\$where=dc_Turkce=$text");
    data = await networkHelper.getData();

    Alert(
      context: context,
      title: "$text",
      desc: '' + data[0]['dc_Ingilizce'],
      buttons: [
        DialogButton(
          color: Colors.teal,
          child: Text(
            "Kapat",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }
}
