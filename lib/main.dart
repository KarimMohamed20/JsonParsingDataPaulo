import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() async {
  List _data = await getJson();

runApp(
    new MaterialApp(
      title: 'Json Fetch Data',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Json Parse"),
          centerTitle: true,
          elevation: 4.0,
          backgroundColor: Colors.orange,
        ),
        body: new ListView.builder(
          itemCount: _data.length,
          padding: EdgeInsets.all(16.0),
          itemBuilder: (BuildContext context,int position){
            final index = position ~/2;
            void _onTapShowDialog(){
  var alert = new AlertDialog(
    title: new Text("App"),
    content: new Text("${_data[index]['title']}"),
    actions: <Widget>[
      new FlatButton(
        onPressed: ()=>Navigator.pop(context),
        child: new Text("Ok"),
      )
    ],
  );
  showDialog(context: context,child: alert);
}
            if(position.isOdd) return new Divider();
            return new ListTile(
              title: new Text("${_data[index]['title']}",
              style: new TextStyle(fontSize: 14.9),),
              leading: new CircleAvatar(
                backgroundColor: Colors.orangeAccent,
                child: new Text("${_data[index]['id']}",
                style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 19.4
                  ),
                ),
              ),
              subtitle: new Text("${_data[index]['body']}",
              style: new TextStyle(
                fontSize: 13.4,
                fontStyle: FontStyle.italic,
                color: Colors.grey
              ),),
              onTap: _onTapShowDialog,
            );
          },
        )
      ),
    ),
    );
}
Future<List> getJson() async {
  String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
  http.Response response = await http.get(apiUrl);
  return JSON.decode(response.body);
}