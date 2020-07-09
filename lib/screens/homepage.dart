import 'package:flutter/material.dart';
import 'package:flutter_spor/components/expanded_item.dart';
import 'package:flutter_spor/screens/ansiklopedi.dart';
import 'package:flutter_spor/screens/beyaz_show.dart';
import 'package:flutter_spor/screens/sozluk.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FlutterSpor'),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              ExpandedItem(
                text: 'Lüzumsuz Bilgiler Listesi',
                buttonColor: Colors.teal,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Ansiklopedi()),
                  );
                },
              ),
              ExpandedItem(
                text: 'Beyaz Show Videoları',
                buttonColor: Colors.teal,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BeyazShow()),
                  );
                },
              ),
              ExpandedItem(
                text: 'Türkçe İngiilizce Sözlük',
                buttonColor: Colors.teal,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Sozluk()),
                  );
                },
              )
            ],
          ),
        ));
  }
}
