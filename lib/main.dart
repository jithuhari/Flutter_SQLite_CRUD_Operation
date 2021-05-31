import 'package:flutter/material.dart';
import 'package:sqlite_project/Screens/home.dart';


void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      
      initialRoute: '/Home',
      routes: {
        // '/home': (context) => Navbar(),
        '/Home': (context) => Home(),
        
     
       
      },
    ));
