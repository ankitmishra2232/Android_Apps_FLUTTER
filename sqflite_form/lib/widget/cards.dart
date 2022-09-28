import 'package:flutter/material.dart';
import 'package:sqflite_form/Database/db_helper.dart';
import 'customform.dart';
import 'package:sqflite_form/model/model.dart';

class cards extends StatelessWidget {
  // const cards({super.key});
  int count=0;
  late String name, mobile, dob, email, address, postal, gender;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Card(
          elevation: 50.0,
          child: FutureBuilder<List<User>>(
            future: DatabaseHelper.instance.getUsers(),
            builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
              if (!snapshot.hasData){
                return Center(child: Text('Nothing.......'));
              }
              return snapshot.data!.isEmpty
                ? Center( child: Text('Empty'))
                : ListView(
                children: snapshot.data!.map((user){
                  return Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Card(
                      elevation: 50.0,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
                        child:
                        // ListTile(
                        //   onTap: (){
                        //     Text(address);
                        //   },
                        //   title: Text(list[count]),
                        //
                        // )
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              user.name,
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                            Text(
                                user.email
                            ),
                            Text(
                                user.mobile
                            ),
                            Text(
                                user.pin
                            )

                          ],
                        ),
                      ),
                    ),
                  );
              }).toList(),
              );
            },
        ),
      ),
    )
    );
  }
}