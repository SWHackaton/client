import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:mockup/api/review.dart';

class DetailView extends StatefulWidget {
  final String storeName;
  final String storeAddr;
  final double storeLon;
  final double storeLat;
  const DetailView(this.storeName, this.storeAddr, this.storeLat, this.storeLon, {Key? key}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState(this.storeName, this.storeAddr, this.storeLat, this.storeLon);
}

class _DetailViewState extends State<DetailView> {
  final String storeName;
  final String storeAddr;
  final double storeLon;
  final double storeLat;
  ReviewClient client = ReviewClient();

  _DetailViewState(this.storeName, this.storeAddr, this.storeLat, this.storeLon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(storeName),
        foregroundColor: NeumorphicColors.defaultTextColor,
        backgroundColor: NeumorphicColors.background,
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            color: Colors.black12,
            child: KakaoMapView(
                width: 500,
                height: 400,
                kakaoMapKey: '46ab0bf9a4ca217252f64b8471259e54',
                lat: storeLat,
                lng: storeLon,
                showMapTypeControl: true,
                showZoomControl: true,
                markerImageURL: 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
                onTapMarker: (message) {
                  //event callback when the marker is tapped
                }),
          ),
          Container(
            child: SizedBox(
              height: 400,
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
                  return  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                            width: double.infinity,
                            child: Text("Photo",style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 24, 29, 54)))),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: SizedBox(
                          height: 100,
                          child: ListView.builder(
                              padding: const EdgeInsets.all(8.0),
                              itemCount: snapshot.data.length,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                if (snapshot.data[index]['img'] != '') {
                                  return SizedBox(
                                    width: 100,
                                    height: 80,
                                    child: Image.network(snapshot.data[index]['img']),
                                  );
                                }
                                return SizedBox(
                                    width: 100,
                                    height: 80,
                                  child: Icon(Icons.event_note_outlined),
                                );
                              }
                          ),
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15.0,5.0,15.0,15.0),
                        child: Container(
                            width: double.infinity,
                            child: Text("Review",style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 24, 29, 54)))),
                      ),
                      Expanded(
                          child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: SizedBox(
                            height: 150,
                            child: ListView.builder(
                                itemCount: snapshot.data.length,
                                scrollDirection: Axis.vertical,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                      width: 200,
                                      height: 100,
                                      child: Card(
                                        color: NeumorphicColors.background,
                                        child: Text(snapshot.data[index]['content']),
                                      )
                                  );
                                }
                            ),
                          )
                      ))
                    ],
                  );
                },),
            )
          )
        ],
      ),
    );
  }

  dynamic getReview() async {
    return await client.getAddress(storeName, storeAddr);
  }
}
