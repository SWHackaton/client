import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mockup/api/review.dart';

import 'detail-view.dart';

class ReviewListView extends StatefulWidget {
  const ReviewListView({Key? key}) : super(key: key);

  @override
  State<ReviewListView> createState() => _ReviewListViewState();
}

class _ReviewListViewState extends State<ReviewListView> {
  ReviewClient client = ReviewClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Review'),
        foregroundColor: NeumorphicColors.defaultTextColor,
        backgroundColor: NeumorphicColors.background,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          // color: Colors.red,
          child: FutureBuilder(
            future: getReview(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              print(snapshot.data);
              if (snapshot.hasData == false) {
                return CircularProgressIndicator();
              }
              else if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: TextStyle(fontSize: 15),
                  ),
                );
              }
              else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      dynamic review = snapshot.data[index];
                      String reviewStore = review['store_name'];
                      String reviewImg = review['img'];
                      String reviewContent = review['content'];
                      return GestureDetector(
                        onTap: () async {
                          var response = await client.getReviewDetail(reviewStore);
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
                                  child: reviewImg == '' ? Icon(Icons.event_note_outlined) : Image.network(reviewImg),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    width: 250,
                                    color: NeumorphicColors.background,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("종목 : $reviewStore"),
                                          Expanded(child: Text("장소 : $reviewContent")),
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
                    });
              }
            },
          )
          )
        ),
      );
  }

  dynamic getReview() async {
    return await client.getReviewAll();
  }
}

