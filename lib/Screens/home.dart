import 'package:flutter/material.dart';
import 'package:sqlite_project/helpers/drawer_nav.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('SQFLite Project'),
      ),
      drawer: DrawerNavigation(),
      
    );
  }
}