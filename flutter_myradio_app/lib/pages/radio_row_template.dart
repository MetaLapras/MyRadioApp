import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myradio_app/models/radio.dart';

class RadioRowTemplate extends StatefulWidget {
  final RadioModel radioModel;

  RadioRowTemplate({Key key, this.radioModel}) : super(key: key);
  @override
  _RadioRowTemplateState createState() => _RadioRowTemplateState();
}

class _RadioRowTemplateState extends State<RadioRowTemplate> {
  @override
  Widget build(BuildContext context) {
    return _buildSongRow();
  }

  Widget _buildSongRow() {
    return ListTile(
      title: new Text(
        this.widget.radioModel.radioName,
        style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      leading: _image(this.widget.radioModel.radioPic),
      subtitle: new Text(this.widget.radioModel.radioDesc, maxLines: 2),
      trailing: Wrap(
        spacing: -10.0, // gap betn adjacent chips
        runSpacing: 0.0, // gap betn lines.
        children: <Widget>[_buildPlayStopIcon(), _buildAddFavouriteIcon()],
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

  Widget _buildPlayStopIcon() {
    return IconButton(
      icon: Icon(Icons.play_circle_filled),
      onPressed: () {},
    );
  }

  Widget _buildAddFavouriteIcon() {
    return IconButton(
      icon: Icon(Icons.favorite_border),
      onPressed: () {},
    );
  }
}
