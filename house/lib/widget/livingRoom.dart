import 'package:flutter/material.dart';
import 'bedroom.dart';
import 'kitchen.dart';

class livingRoom extends StatelessWidget {
  const livingRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackButton(),
        title: const Text("Living Room"),
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 230.0, 0.0, 0.0),
              child: Image.asset('assets/images/livingRoom.jpg')
          ),
          Container(
            margin: EdgeInsets.fromLTRB(336.4,286.8,0.0,0.0),
            height: 120,
            width: 50,
            child: ElevatedButton(
              child: Text(""),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Kitchen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black12,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(27.0,286.8,0.0,0.0),
            height: 120,
            width: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BedRoom()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black12,
              ),
              child: const Text(""),
            ),
          )
        ],
      ),
    );
  }
}