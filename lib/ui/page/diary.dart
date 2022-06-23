import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Diary extends StatefulWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("날짜"),
          foregroundColor: NeumorphicColors.defaultTextColor,
          backgroundColor: NeumorphicColors.background,
        ),
        body: Container(
          color: Colors.white,
          width: double.infinity,
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 10),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Color.fromARGB(255, 24, 29, 54),
                  width: 5,
                  height: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 20),
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: 300,
                    // color: Colors.blue,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "제목",
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "내용",
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            // child: Column(
            //   // mainAxisAlignment: MainAxisAlignment.s,
            //   children: [
            //     Container(
            //       alignment: Alignment.topLeft,
            //         child: Text("제목")),
            //     TextField()
            //   ],
            // ),
          ),
        ));
  }
}
