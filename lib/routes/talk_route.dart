import 'package:flutter/material.dart';
import 'package:fluttertestapp/routes/talk/tile.dart';

class Talk extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    var _talk = <Widget>[];
    for(var i = 0;i<=10;i++){
      _talk.add(Tile(
        icon:Icons.person,
        username:'Name' + i.toString(),
        message:'Message' + i.toString(),
      ));
    }

    return Scaffold(
      appBar:AppBar(
        title:Text('Talk'),
      ),
      body:ListView(
        padding: const EdgeInsets.all(8.0),
        children:_talk,
      ),
    );
  }
}