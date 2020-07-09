import 'package:flutter/material.dart';
import 'package:flutter_spor/models/bilgi.dart';
import 'package:flutter_spor/screens/ansiklopedi_detay.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Ansiklopedi extends StatefulWidget {
  @override
  _AnsiklopediState createState() => new _AnsiklopediState();
}

class _AnsiklopediState extends State<Ansiklopedi> {
  Future<List<Bilgi>> _getUsers() async {
    var data = await http.get("https://www.netdata.com/JSON/21FC2BE0");

    var jsonData = json.decode(data.body);

    List<Bilgi> users = [];

    for (var u in jsonData) {
      Bilgi user = Bilgi(
          id: u['ID'],
          kategori: u['dc_Kategori'],
          cevap: u['dc_Cevap'],
          soru: u['dc_Soru']);

      users.add(user);
    }

    print(users.length);

    return users;
  }

  Future future;
  @override
  void initState() {
    super.initState();
    future = _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Lüzumsuz Bilgiler Ansiklopedisi'),
      ),
      body: Container(
        child: FutureBuilder(
          future: future,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Yükleniyor...")));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                // ignore: missing_return
                itemBuilder: (BuildContext context, int index) {
                  if (index != 0) {
                    if (snapshot.data[index].kategori !=
                        snapshot.data[index - 1].kategori) {
                      return ListTile(
                        leading: Icon(
                          Icons.arrow_right,
                          color: Colors.teal,
                        ),
                        title: Text(snapshot.data[index].kategori),
                        onTap: () {
                          var kategori = snapshot.data[index].kategori;
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => AnsiklopediDetay(
                                      data: snapshot.data,
                                      category: kategori)));
                        },
                      );
                    }
                    return Container();
                  } else if (index == 0) {
                    return ListTile(
                      leading: Icon(Icons.arrow_right),
                      title: Text(snapshot.data[index].kategori),
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => AnsiklopediDetay(
                                      data: snapshot.data,
                                      category: snapshot.data[index].kategori,
                                    )));
                      },
                    );
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
