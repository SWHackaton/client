import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mockup/api/review.dart';

import 'detail-view.dart';

class CategoryListView extends StatefulWidget {
  final String title;
  final dynamic stores;
  final Icon icon;
  const CategoryListView(this.title, this.stores, this.icon, {Key? key}) : super(key: key);

  @override
  State<CategoryListView> createState() => _CategoryListViewState(this.title, this.stores, this.icon);
}

class _CategoryListViewState extends State<CategoryListView> {
  final String title;
  final dynamic stores;
  final Icon icon;
  ReviewClient client = ReviewClient();
  _CategoryListViewState(this.title, this.stores, this.icon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        foregroundColor: NeumorphicColors.defaultTextColor,
        backgroundColor: NeumorphicColors.background,
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          // color: Colors.red,
          child: ListView.builder(
              itemCount: stores.length,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                dynamic store = stores[index];
                String storeCategory = store['category'];
                String storeName = store['store_name'];
                String storeDong = store['dong'];
            return GestureDetector(
              onTap: () async {
                var response = await client.getReviewDetail(storeName);
                Navigator.push(context,MaterialPageRoute(builder: (context) => DetailView(response['store'], response['addr'], response['latitude'], response['longitude'])));
              },
              child: SizedBox(
                height: 150,
                width: 50,
                child: Card(
                  color: NeumorphicColors.background,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        alignment: Alignment.center,
                        child: store['img'] == '' ? icon : Image.network(store['img']),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: 200,
                          color: NeumorphicColors.background,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("종목 : $storeCategory"),
                                Text("장소 : $storeName"),
                                Text("위치 : $storeDong"),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          })
          )
        ),
      );
  }
}

