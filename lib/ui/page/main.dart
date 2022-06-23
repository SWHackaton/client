import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:timelines/timelines.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.only(bottom: 16),
                    child: NeumorphicButton(
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
            child: ListView(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                const SizedBox(
                  height: 16,
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: Card(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Text("오늘의 시작"),
                        ],
                      ),
                    ),
                  ),
                  node: const TimelineNode(
                    indicator: DotIndicator(),
                    endConnector: SolidLineConnector(),
                  ),
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  oppositeContents: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('오후 12시 34분'),
                  ),
                  contents: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: const [
                            Text("아이디어팩토리"),
                            Text("서울시 강남구 테헤란로 4길 14 미림타워")
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
                ),
                TimelineTile(
                  nodePosition: 0.3,
                  nodeAlign: TimelineNodeAlign.basic,
                  contents: Card(
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
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
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