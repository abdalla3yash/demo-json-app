import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo Json App')),
      body: new Container(
          child: Center(
              child: FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('load_json/person.json'),
        builder: (context, snapshot) {
          // decode json
          var mydata = json.decode(snapshot.data.toString());
          return new ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                  child: Row(//crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                CircleAvatar(
                  child: Text(mydata[index]['name'][0]),
                  radius: 30.0,
                ),
                Padding(padding: const EdgeInsets.all(4.0)),
                Column(
                  children: <Widget>[
                    Text(mydata[index]['name']),
                    Text(mydata[index]['gender']),
                    Text("Age: " + mydata[index]['age']),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("Height: " + mydata[index]['height']),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 14.0,
                        ),
                        Text(mydata[index]['city']),
                      ],
                    ),
                    Text("Hair Color: " + mydata[index]['hair_color']),
                  ],
                ),
              ]));
            },
            itemCount: mydata == null ? 0 : mydata.length,
          );
        },
      ))),
    );
  }
}
