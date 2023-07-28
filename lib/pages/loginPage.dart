import '../component/googleSignInButton.dart';
import '../function/authentication.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 100.0),
            Container(
              height: 153,
              child: Image.asset('assets/sriracha.png'),
              // child: Image.asset('assets/app.jpg', fit: BoxFit.fitHeight,),
            ),
            const SizedBox(height: 40.0),
            Row(
              children: const [
                Spacer(flex: 1,),
                Text('SRIRACHA', style: TextStyle(fontSize: 45),),
                Spacer(flex: 1,),
              ],
            ),
            const SizedBox(height: 80.0),
            FutureBuilder(
              future: Authentication.initializeFirebase(context: context,),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Error initializing Firebase');
                }else {
                  return const GoogleSignInButton();
                }
              },
            ),

            const SizedBox(
              height: 250,
            ),
            Row(
              children: const [
                Spacer(flex: 1,),
                Text('YOUNGCHA', style: TextStyle(fontSize: 15),),
                Spacer(flex: 1,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

