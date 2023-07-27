import 'package:app/pages/loginPage.dart';
import 'package:app/pages/myPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/homePage.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting().then((_) => runApp(MainApp()));
}


class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      initialRoute: '/login',
      routes: {
        '/home': (context) => HomePage(),
        '/mypage': (context) => MyPage(),
        '/login' : (context) => Login(),
      },
    );
  }
}
