import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MyListView extends StatefulWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ListView"),
        foregroundColor: NeumorphicColors.defaultTextColor,
        backgroundColor: NeumorphicColors.background,
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          // color: Colors.red,
          child: ListView(
            children: [
              SizedBox(
                height: 200,
                width: 50,
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(""),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          width: 170,
                          color: NeumorphicColors.background,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("장소 : "),
                                Text("메모 : "),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                width: 50,
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(""),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          width: 170,
                          color: NeumorphicColors.background,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("장소 : "),
                                Text("메모 : "),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                width: 50,
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(""),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          width: 170,
                          color: NeumorphicColors.background,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("장소 : "),
                                Text("메모 : "),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                width: 50,
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(""),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          width: 170,
                          color: NeumorphicColors.background,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("장소 : "),
                                Text("메모 : "),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
