import 'package:flutter/material.dart';
import '../components/calendarComponent.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarHeight: 35,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('My Page'),
              onTap: () {
                Navigator.pushNamed(context, '/mypage');
              },
            ),
            // ListTile(
            //   title: const Text('Item 2'),
            //   onTap: () {
            //     // Update the state of the app.
            //     // ...
            //   },
            // ),
          ],
        ),
      ),
      body: calendarComponent(),
    );
  }
}
