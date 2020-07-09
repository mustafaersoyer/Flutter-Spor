import 'package:flutter/material.dart';

class AnsiklopediDetay extends StatelessWidget {
  AnsiklopediDetay({this.category, this.data});
  final data;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: SingleChildScrollView(
        child: Column(children: getContent()),
      ),
    );
  }
  /*<Widget>[
  Container()
  ] */

  List<Container> getContent() {
    List<Container> columnList = new List();
    for (int i = 0; i < data.length; i++) {
      if (data[i].kategori == category) {
        var newItem = Container(
          margin: EdgeInsets.fromLTRB(15, 15, 10, 5),
          child: Column(
            children: <Widget>[
              Text(
                'Soru: ' + data[i].soru,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              Divider(
                height: 5,
                thickness: 1,
              ),
              SizedBox(height: 15),
              Text('Cevap: ' + data[i].cevap),
            ],
          ),
        );

        columnList.add(newItem);
      }
    }
    return columnList;
  }
}
