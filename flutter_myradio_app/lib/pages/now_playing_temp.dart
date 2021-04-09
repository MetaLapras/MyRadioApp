import 'package:flutter/material.dart';

class NowPlaying extends StatelessWidget {
  final String radioTitle;
  final String radioImageURL;

  const NowPlaying({Key key, this.radioTitle, this.radioImageURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.blueAccent[200]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _nowPlayingText(context, this.radioTitle, this.radioImageURL)
            ],
          ),
        ),
      ),
    );
  }

  Widget _nowPlayingText(BuildContext context, String title, String imgURL) {
    return new Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 5, 10),
      child: ListTile(
        title: new Text(
          title,
          style:
              new TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: new Text(
          "Now Playing",
          textScaleFactor: 0.8,
          style: new TextStyle(color: Colors.black),
        ),
        leading: _image(imgURL, size: 50.0),
        trailing: Wrap(
          spacing: -10.0,
          children: <Widget>[_buildStopIcon(context), _buildShareIcon()],
        ),
      ),
    );
  }

  Widget _image(url, {size}) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.network(url),
      ),
      height: size == null ? 55 : size,
      width: size == null ? 55 : size,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 0), //to Change position of Shadow
            )
          ]),
    );
  }

  Widget _buildStopIcon(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.stop),
      onPressed: () {},
    );
  }

  Widget _buildShareIcon() {
    return IconButton(
      icon: Icon(Icons.share),
      onPressed: () {},
    );
  }
}
