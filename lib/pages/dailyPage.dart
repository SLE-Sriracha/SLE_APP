import 'package:app/component/dailyComponent.dart';
import 'package:app/component/dailyEmotion.dart';
import 'package:app/pages/homePage.dart';
import 'package:app/pages/myPage.dart';
import 'package:flutter/material.dart';

class DayPage extends StatefulWidget {
  const DayPage({Key? key}) : super(key: key);

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  //뒤로가기 잔상 제거하기
  bool _isCheckStudy1 = false;
  bool _isCheckStudy2 = false;
  bool _isCheckElseStudy1 = false;
  bool _isCheckElseStudy2 = false;
  bool _isCheckElse1 = false;
  bool _isCheckElse2 = false;

  List<String> checkList = [];

  DateTime _Today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${_Today.month.toString()}월${_Today.day.toString()}일", style: const TextStyle(fontSize: 20),),
            const SizedBox(width: 50,),
            const Text("Where there is a will,\nthere is a way\n: 의지가 있다면 길이 있다.", style: TextStyle(fontSize: 15),),
          ]
        ),
        toolbarHeight: 90,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30,),
          const Center(
            child: Text(
              "오늘 나는?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30,),
          const DailyEmotion(),
          const SizedBox(height: 40,),
          SizedBox(
            width: 500,
            child: Column(
              children: [
                DailyComponent(title: '학업'),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Divider(thickness: 2.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _isCheckStudy1,
                        onChanged: (value) {
                          setState(() {
                            _isCheckStudy1 = value!;
                          });
                        },
                      ),
                      const Text("데이터구조 복습")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _isCheckStudy2,
                        onChanged: (value) {
                          setState(() {
                            _isCheckStudy2 = value!;
                          });
                        },
                      ),
                      Text("Java hw3 제출")
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          SizedBox(
            width: 500,
            child: Column(
              children: [
                const DailyComponent(title: '학업 외'),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Divider(thickness: 2.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _isCheckElseStudy1,
                        onChanged: (value) {
                          setState(() {
                            _isCheckElseStudy1 = value!;
                          });
                        },
                      ),
                      const Text("사회봉사 보고서 제출")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _isCheckElseStudy2,
                        onChanged: (value) {
                          setState(() {
                            _isCheckElseStudy2 = value!;
                          });
                        },
                      ),
                      const Text("슬기짜기 랩 미팅")
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          SizedBox(
            width: 500,
            child: Column(
              children: [
                const DailyComponent(title: '그 외'),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Divider(thickness: 2.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _isCheckElse1,
                        onChanged: (value) {
                          setState(() {
                            _isCheckElse1 = value!;
                          });
                        },
                      ),
                      const Text("팀 가족 밥고")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _isCheckElse2,
                        onChanged: (value) {
                          setState(() {
                            _isCheckElse2 = value!;
                          });
                        },
                      ),
                      const Text("중파 준비")
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}