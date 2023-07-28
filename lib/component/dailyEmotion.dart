import 'package:flutter/cupertino.dart';

class DailyEmotion extends StatelessWidget {
  const DailyEmotion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          'assets/dailyImage/001.png',
          width: 30,
          height: 30,
        ),
        Image.asset(
          'assets/dailyImage/002.png',
          width: 30,
          height: 30,
        ),
        Image.asset(
          'assets/dailyImage/003.png',
          width: 30,
          height: 30,
        ),
        Image.asset(
          'assets/dailyImage/004.png',
          width: 30,
          height: 30,
        ),
        Image.asset(
          'assets/dailyImage/005.png',
          width: 30,
          height: 30,
        ),
        Image.asset(
          'assets/dailyImage/006.png',
          width: 30,
          height: 30,
        ),
      ],
    );
  }
}
