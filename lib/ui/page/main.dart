import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mockup/api/location.dart';
import 'package:mockup/ui/page/detailView.dart';
import 'package:timelines/timelines.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime selectedDate = DateTime.now();
  LocationClient client = LocationClient();

  @override
  Widget build(BuildContext context) {
    dynamic timelines;

    TimelineTile startTile() {
      return TimelineTile(
        nodePosition: 0.3,
        nodeAlign: TimelineNodeAlign.basic,
        oppositeContents: Card(
          color: NeumorphicColors.background,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>DetailView())),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: const [
                    Text("오늘의 시작"),
                  ],
                ),
              ),
            ),
          ),
        ),
        node: const TimelineNode(
          indicator: DotIndicator(),
          startConnector: SolidLineConnector(),
          endConnector: SolidLineConnector(),
        ),
      );
    }

    TimelineTile endTile() {
      return TimelineTile(
        nodePosition: 0.3,
        nodeAlign: TimelineNodeAlign.basic,
        contents: Card(
          color: NeumorphicColors.background,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: const [
                Text("오늘의 끝"),
              ],
            ),
          ),
        ),
        node: const TimelineNode(
          indicator: DotIndicator(),
          startConnector: SolidLineConnector(),
        ),
      );
    }

    TimelineTile createTime(String storeStart, dynamic storeName, String storeAddr) {
      return TimelineTile(
        nodePosition: 0.3,
        nodeAlign: TimelineNodeAlign.basic,
        oppositeContents: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(storeStart),
        ),
        contents: Container(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(storeName ?? "장소가 아직 선택되지 않았습니다."),
                  Text(storeAddr)
                ],
              ),
            ),
          ),
        ),
        node: const TimelineNode(
          indicator: DotIndicator(),
          startConnector: SolidLineConnector(),
          endConnector: SolidLineConnector(),
        ),
      );
    }

    return NeumorphicBackground(
      child: Column(
        children: [
          Material(
            elevation: 10,
            child: Container(
              color: NeumorphicColors.background,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 24, 29, 54)),
                      onPressed: () {
                        _selectTime(context, "날짜를 선택하세요.");
                      },
                      child: Text(
                          "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: getTimeLine(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                  // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
                  else {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          var timeline = snapshot.data[index];
                          var storeName = timeline['visit']['store_name'];
                          String storeStart = timeline['visit']['start_datetime'];
                          String storeEnd = timeline['visit']['end_datetime'];
                          String storeTime = storeStart.substring(11, 16) + " - " + storeEnd.substring(11, 16);
                          String storeAddr = timeline['address']['addr'];
                          double longitude = timeline['address']['longitude'];
                          double latitude = timeline['address']['latitude'];
                          if (index == 0) {
                            return Column(
                              children: [
                                const SizedBox(
                                  height: 16,
                                ),
                                startTile(),
                                createTime(storeTime, storeName, storeAddr)
                              ],
                            );
                          }
                          else if (index == snapshot.data.length - 1) {
                            return Column(
                              children: [
                                createTime(storeTime, storeName, storeAddr),
                                endTile(),
                                const SizedBox(height: 32),
                              ],
                            );
                          } else {
                            return createTime(storeTime, storeName, storeAddr);
                          }
                        }
                    );
                  }
                })
          ),
        ],
      ),
    );
  }

  dynamic getTimeLine() async {
    return await client.getLastTimeStamp('user02', "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}");
  }

  void _selectTime(BuildContext context, String title) async {
    final DateTime? timeOfDay = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime(1970),
      lastDate: selectedDate,
      helpText: title,
      cancelText: "취소",
      confirmText: "확인",
      locale: Localizations.localeOf(context),
    );
    if (timeOfDay != selectedDate) {
      setState(() {
        selectedDate = timeOfDay ?? selectedDate;
      });
    }
  }
}
