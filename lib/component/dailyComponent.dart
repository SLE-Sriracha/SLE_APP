import 'package:flutter/cupertino.dart';

class DailyComponent extends StatelessWidget {
  const DailyComponent({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Text(title,style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
          ),
        ),
        const Spacer(flex: 10,),
        const Text("+", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        const Spacer(flex: 1,),
      ],
    );
  }
}
