import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:http/http.dart';
import 'package:mockup/api/store.dart';

import 'category-list.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController _textEditController = TextEditingController();
  StoreClient client = StoreClient();
  @override
  void dispose() {
    super.dispose();
    _textEditController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Column(
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
                  controller: _textEditController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple)
                    ),
                    labelText: '장소, 버스, 지하철, 도로 등 검색',
                  ),
                  onSubmitted: (text) async {
                    print("submit text: $text");
                    var response = await client.getSearchResult(text);
                    print(response);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryListView(text, response['result'], Icon(Icons.directions_bus_rounded,
                        size: 50,
                        color: Color.fromARGB(200, 24, 29, 54))
                    )));
                  },
                ),

              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 5.0),
                child: Container(
                    // color: Colors.deepPurpleAccent,
                    width: double.infinity,
                    child: Text("Categories",
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
                            onPressed: () async {
                              var response = await client.getSelectCategory('meal');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryListView('식사', response['result'], Icon(Icons.dinner_dining,
                                  size: 50,
                                  color: Color.fromARGB(200, 24, 29, 54)))));
                            },
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
                            onPressed: () async {
                              var response = await client.getSelectCategory('drink');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryListView('음료', response['result'], Icon(Icons.emoji_food_beverage,
                                  size: 50,
                                  color: Color.fromARGB(200, 24, 29, 54)
                              ))));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.emoji_food_beverage,
                                    size: 50,
                                    color: Color.fromARGB(200, 24, 29, 54)),
                                Text("음료",
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
                            onPressed: () async {
                              var response = await client.getSelectCategory('shopping');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryListView('쇼핑', response['result'], Icon(Icons.shopping_cart,
                                  size: 50,
                                  color: Color.fromARGB(200, 24, 29, 54)))));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.shopping_cart,
                                    size: 50,
                                    color: Color.fromARGB(200, 24, 29, 54)),
                                Text("쇼핑",
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
                            onPressed: () async {
                              var response = await client.getSelectCategory('culture');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryListView('문화', response['result'], Icon(Icons.home_work_outlined,
                                  size: 50,
                                  color: Color.fromARGB(200, 24, 29, 54))
                              )));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.home_work_outlined,
                                    size: 50,
                                    color: Color.fromARGB(200, 24, 29, 54)),
                                Text("문화",
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
                            onPressed: () async {
                              var response = await client.getSelectCategory('travel');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryListView('관광', response['result'], Icon(Icons.tour,
                                  size: 50,
                                  color: Color.fromARGB(200, 24, 29, 54))
                              )));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.tour,
                                    size: 50,
                                    color: Color.fromARGB(200, 24, 29, 54)),
                                Text("관광",
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
                            onPressed: () async {
                              var response = await client.getSelectCategory('hotel');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryListView('호텔', response['result'], Icon(Icons.hotel,
                                  size: 50,
                                  color: Color.fromARGB(200, 24, 29, 54))
                              )));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.hotel,
                                    size: 50,
                                    color: Color.fromARGB(200, 24, 29, 54)),
                                Text("호텔",
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
                            onPressed: () async {
                              var response = await client.getSelectCategory('subway');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryListView('지하철', response['result'], Icon(Icons.subway,
                                  size: 50,
                                  color: Color.fromARGB(200, 24, 29, 54))
                              )));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.subway,
                                    size: 50,
                                    color: Color.fromARGB(200, 24, 29, 54)),
                                Text("지하철",
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
                            onPressed: () async {
                              var response = await client.getSelectCategory('bus');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryListView('지하철', response['result'], Icon(Icons.directions_bus_rounded,
                                  size: 50,
                                  color: Color.fromARGB(200, 24, 29, 54))
                              )));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.directions_bus_rounded,
                                    size: 50,
                                    color: Color.fromARGB(200, 24, 29, 54)),
                                Text("버스",
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
                            onPressed: () async {
                              var response = await client.getSelectCategory('airplane');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryListView('지하철', response['result'], Icon(Icons.local_airport,
                                  size: 50,
                                  color: Color.fromARGB(200, 24, 29, 54))
                              )));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.local_airport,
                                    size: 50,
                                    color: Color.fromARGB(200, 24, 29, 54)),
                                Text("공항",
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
                ],
              ),
            ]),
      ),
    );
  }
}
