import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DetailView extends StatefulWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Time Line"),
        foregroundColor: NeumorphicColors.defaultTextColor,
        backgroundColor: NeumorphicColors.background,
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            color: Colors.black12,
            child: Text(""),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      width: double.infinity,
                      child: Text("Photo",style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 24, 29, 54)))),
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  child: ListView(
                    scrollDirection : Axis.horizontal,
                    children: [
                      Image.asset("name"),
                      Image.asset("name"),
                      Image.asset("name"),
                      Image.asset("name"),
                      Image.asset("name"),
                    ],
                  )
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0,5.0,15.0,15.0),
                  child: Container(
                      width: double.infinity,
                      child: Text("Memo",style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 24, 29, 54)))),
                ),
                Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0,0.0,15.0,15.0),
                      child: Text(" 기모띠 "),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
