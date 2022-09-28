import 'package:flutter/material.dart';

class BathRoom extends StatelessWidget {
  const BathRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackButton(),
        title: const Text("BathRoom"),
      ),
      body: Stack(
        children: [
          Container(
              // margin: EdgeInsets.fromLTRB(0.0, 130.0, 0.0, 0.0),
              child: Image.asset('assets/images/bathroom.jpg')
          ),

        ],
      ),
    );
  }
}