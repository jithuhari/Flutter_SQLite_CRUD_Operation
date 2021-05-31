import 'package:flutter/material.dart';
import 'package:sqlite_project/Screens/home.dart';
import 'package:sqlite_project/Screens/list_page.dart';

class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Drawer(
        child: ListView(

          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture:CircleAvatar(
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXpqJaSj0pgE2MF83qlTJ3G0OC1YVlqYlj1g&usqp=CAU'),
              ) ,
              accountName: Text('Jithu'), 
              accountEmail: Text('admin@gmail.com'),
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              ),

            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: (){
                 Navigator.push(context, 
                          MaterialPageRoute(builder:(BuildContext context)=>
                          Home()));
              },
              

            ),
            ListTile(
              title: Text('List'),
              leading: Icon(Icons.list),
              onTap: (){
                 Navigator.push(context, 
                          MaterialPageRoute(builder:(BuildContext context)=>
                          ListPage()));
              },
            )
              
          ],

        ),
      ),
      
    );
  }
}