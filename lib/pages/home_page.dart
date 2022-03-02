import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String id='HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Welcom to PDP', style: TextStyle(color: Colors.black, fontSize: 50, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
