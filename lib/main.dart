import 'package:app/pages/loginPage.dart';
import 'package:app/pages/myPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/homePage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting().then((_) => runApp(MainApp()));
  FlutterNativeSplash.remove();
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
      home: const HomePage(),
      initialRoute: '/login',
      routes: {
        '/home': (context) => const HomePage(),
        '/mypage': (context) => const MyPage(),
        '/login' : (context) => const Login(),
      },
    );
  }
}
