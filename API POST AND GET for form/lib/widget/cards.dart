import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class cards extends StatefulWidget {
  @override
  State<cards> createState() => _CardState();
  // const cards({super.key});
}

class _CardState extends State<cards>{
  List<User1> users = [];

  Future fetchNotes() async{
    // var notes = <User1>[];
    var response = await http.get(Uri.parse('https://script.google.com/macros/s/AKfycbwnA1B4_g5QNgRy_XdPRmLeSki4tskjM2CiwpH-4egavdyB6uw7N0iZb_y0O2F9pG6e/exec?action=getUsers'));
    var notesJson = jsonDecode(response.body);
    for(var u in notesJson){
      User1 user =User1(u["Name"],u["email"]);
      users.add(user);
    }
    print(users.length);
    return users;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return Scaffold(
      appBar: AppBar(
        title: Text('Information'),
      ),
      body: Container(
        child: Card(
          child: FutureBuilder(
                future: fetchNotes(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data==null) {
                    return Container(
                      child: Text("Loading"),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, i){
                          return ListTile(
                            title: Text(snapshot.data[i].Name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
                            subtitle: Text(snapshot.data[i].email),
                          );
                        }
                    );
                  }
                }),
        ),
      )

    );
  }

}
class User1{
  final String Name;
  final String email;
  User1(this.Name, this.email);
}