import 'package:flutter/material.dart';
import 'package:flutter_spor/models/video.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

import 'dart:async';

import '../services/networking.dart';

class BeyazShow extends StatefulWidget {
  @override
  _BeyazShowState createState() => new _BeyazShowState();
}

class _BeyazShowState extends State<BeyazShow> {
  Future<List<Video>> _getVideos() async {
    NetworkHelper networkHelper =
        NetworkHelper("https://www.netdata.com/JSON/1d35eb7f");
    var jsonData = await networkHelper.getData();

    List<Video> videos = [];

    for (var u in jsonData) {
      Video user = Video(
          id: u['ID'],
          link: u['dc_Link'],
          tarih: u['dc_Yayinlanma_Tarihi'],
          videoBaslik: u['dc_Video_Baslik']);

      videos.add(user);
    }

    print(videos.length);

    return videos;
  }

  Future future;
  @override
  void initState() {
    super.initState();
    future = _getVideos();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Beyaz Show Videoları'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        child: FutureBuilder(
          future: future,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Yükleniyor...")));
            } else {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Wrap(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: GestureDetector(
                          onTap: () {
                            FlutterYoutube.playYoutubeVideoByUrl(
                                apiKey:
                                    "eb7608ce2bc10f7ed7d8c257f5dda56db3136094",
                                videoUrl:
                                    "https://www.youtube.com/watch?v=hta2MAu5lek",
                                autoPlay: true, //default falase
                                fullScreen: true //default false
                                );
                          },
                          child: Card(
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(
                                    Icons.video_library,
                                    color: Colors.red,
                                  ),
                                  title: Text(snapshot.data[index].videoBaslik),
                                  subtitle: Text(snapshot.data[index].link),
                                ),
                                Container(
                                  child: Text(snapshot.data[index].tarih
                                      .substring(0, 10)),
                                  margin: EdgeInsets.only(left: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
