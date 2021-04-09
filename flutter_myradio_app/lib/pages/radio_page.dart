import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_myradio_app/models/radio.dart';
import 'package:flutter_myradio_app/pages/now_playing_temp.dart';
import 'package:flutter_myradio_app/pages/radio_row_template.dart';

class RadioPage extends StatefulWidget {
  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  RadioModel radioModel = new RadioModel(
      id: 1,
      radioName: "Test Radio 1",
      radioDesc: "Test Radio Desc",
      radioPic:
          "https://lh3.googleusercontent.com/proxy/F9KpTqcdFV5YDk5DzzK2OYrjIqSTUN6QzhFdI1PEQowlQCnwO2lg-3AFqpvaVTtent4xZSegpucjd-TAfP3a4Oady6nHTnFQESM");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _appLogo(),
          _searchBar(),
          _radiosList(),
          NowPlaying(
            radioTitle: "Radio 93.7",
            radioImageURL:
                "http://pngimg.com/uploads/radio/radio_PNG91671.png",
          )
        ],
      ),
    );
  }

  Widget _appLogo() {
    return Container(
        width: double.infinity,
        color: Colors.lightBlueAccent,
        height: 80,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: new Text("MyRadio",
                style: TextStyle(fontSize: 30, color: Colors.white)),
          ),
        ));
  }

  Widget _searchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.search),
          new Flexible(
            child: new TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(5),
                  hintText: 'Search Radio'),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _radiosList() {
    return new Expanded(
        child: Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: ListView(
        children: <Widget>[
          ListView.separated(
            itemCount: 10,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return RadioRowTemplate(radioModel: radioModel);
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          )
        ],
      ),
    ));
  }
}
