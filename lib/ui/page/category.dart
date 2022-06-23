import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  // TextEditingController searchData!;

  @override
  Widget build(BuildContext context) {
    return Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
                // color: Colors.deepPurpleAccent,
                width: double.infinity,
                child: Text("Search",
                    style: TextStyle(
                        fontSize: 30, color: Color.fromARGB(255, 24, 29, 54)))),
          ),
          Container(
            height: 30,
            width: 350,
            child: TextField(
                // controller: searchData,
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '장소, 버스, 지하철, 도로 검색',
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                // color: Colors.deepPurpleAccent,
                width: double.infinity,
                child: Text("\nCategories",
                    style: TextStyle(
                        fontSize: 30, color: Color.fromARGB(255, 24, 29, 54)))),
          ),


          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Neumorphic(
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(15)),
                          depth: 7,
                          lightSource: LightSource.topLeft,
                          color: Colors.grey,

                      ),
                      child: NeumorphicButton(
                        onPressed: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.dinner_dining,
                                size: 50,
                                color: Color.fromARGB(200, 24, 29, 54)),
                            Text("식사",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 24, 29, 54))),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Neumorphic(
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(12)),
                          depth: 5,
                          lightSource: LightSource.topLeft,
                          color: Colors.grey),
                      child: NeumorphicButton(
                        onPressed: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.dinner_dining,
                                size: 50,
                                color: Color.fromARGB(200, 24, 29, 54)),
                            Text("식사",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 24, 29, 54))),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Neumorphic(
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(12)),
                          depth: 5,
                          lightSource: LightSource.topLeft,
                          color: Colors.grey),
                      child: NeumorphicButton(
                        onPressed: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.dinner_dining,
                                size: 50,
                                color: Color.fromARGB(200, 24, 29, 54)),
                            Text("식사",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 24, 29, 54))),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Icon(Icons.dinner_dining,
                              size: 50,
                              color: Color.fromARGB(200, 24, 29, 54)),
                          Text("식사",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 24, 29, 54))),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          primary: Colors.white30,
                          minimumSize: Size(100, 100)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Icon(Icons.dinner_dining,
                              size: 50,
                              color: Color.fromARGB(200, 24, 29, 54)),
                          Text("식사",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 24, 29, 54))),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          primary: Colors.white30,
                          minimumSize: Size(100, 100)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Icon(Icons.dinner_dining,
                              size: 50,
                              color: Color.fromARGB(200, 24, 29, 54)),
                          Text("식사",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 24, 29, 54))),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          primary: Colors.white30,
                          minimumSize: Size(100, 100)),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Icon(Icons.dinner_dining,
                              size: 50,
                              color: Color.fromARGB(200, 24, 29, 54)),
                          Text("식사",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 24, 29, 54))),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          primary: Colors.white30,
                          minimumSize: Size(100, 100)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Icon(Icons.dinner_dining,
                              size: 50,
                              color: Color.fromARGB(200, 24, 29, 54)),
                          Text("식사",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 24, 29, 54))),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          primary: Colors.white30,
                          minimumSize: Size(100, 100)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Icon(Icons.dinner_dining,
                              size: 50,
                              color: Color.fromARGB(200, 24, 29, 54)),
                          Text("식사",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 24, 29, 54))),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          primary: Colors.white30,
                          minimumSize: Size(100, 100)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]);
  }
}
