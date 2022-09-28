import 'package:flutter/material.dart';


class Kitchen extends StatelessWidget {
  const Kitchen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackButton(),
        title: const Text("Kitchen"),
      ),
      body: Stack(
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(0.0, 130.0, 0.0, 0.0),
              child: Image.asset('assets/images/kitchen.jpeg')
          ),
          // Container(
          //   margin: EdgeInsets.fromLTRB(336.4,286.8,0.0,0.0),
          //   height: 120,
          //   width: 50,
          //   child: ElevatedButton(
          //     child: Text(""),
          //     onPressed: () {
          //       // Navigator.pop(context);   it will move back to previous page
          //     },
          //     style: ElevatedButton.styleFrom(
          //       primary: Colors.black12,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}