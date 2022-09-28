import 'package:flutter/material.dart';

import 'Bathroom.dart';


class BedRoom extends StatelessWidget {
  const BedRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackButton(),
        title: const Text("BedRoom"),
      ),
      body: Stack(
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(0.0, 230.0, 0.0, 0.0),
              child: Image.asset('assets/images/bedroom.jpg')
          ),
          Container(
            margin: EdgeInsets.fromLTRB(301.4,230.8,0.0,0.0),
            height: 120,
            width: 60,
            child: ElevatedButton(
              child: Text(""),
              onPressed: () {
                // Navigator.pop(context);  it will move back to previous page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BathRoom()),
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