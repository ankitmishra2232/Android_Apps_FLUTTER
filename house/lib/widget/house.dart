import 'package:flutter/material.dart';
import 'livingRoom.dart';

class House extends StatelessWidget {
  const House({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        // leading: BackButton(),
        title: Text("House"),
      ),
      body: Stack(
        children: [
          Container(
              child: Image.asset('assets/images/house.jpg')
          ),
          Container(
            margin: EdgeInsets.fromLTRB(206.0,423.0,0.0,0.0),
            height: 70,
            width: 32,
            child: ElevatedButton(
              child: Text(""),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const livingRoom()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
