import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Page',
          style: TextStyle(fontSize: 40, color: Colors.black),
        ),
        centerTitle: true,
        toolbarHeight: 120,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: ListView(
          children: [
            const Divider(
              thickness: 1.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
            const SizedBox(
              height: 30,
            ),
            const CircleAvatar(
              radius: 80,
              backgroundColor: Color(0xffFDCF09),
              child: CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage('assets/myPage_testPic.jpg'),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              title: const Text('  Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('  Item 2'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('  Item 3'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('  Item 4'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
