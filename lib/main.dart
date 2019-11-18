import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';

void main() => runApp(MaterialApp(title: "My App", home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List post;

  Future<String> loadData() async{
    var jsonText = await rootBundle.loadString('assets/data.json');
    
    setState(() {
      post = jsonDecode(jsonText);
    });

    return "susscess";
  }

  @override
  void initState(){
    this.loadData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: ListView.builder(
        itemCount: post.length,
          itemBuilder: (BuildContext contex, int index){
          return Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(child: Text(post[index]['name'][0])),
                title: Text(post[index]['name']),
                subtitle: Text(post[index]['email']),
              )

            ],
          );
          },
      )
    );
  }
}


