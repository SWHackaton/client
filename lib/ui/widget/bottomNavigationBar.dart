import 'package:flutter/material.dart';
import 'package:mockup/ui/dialog/smoothDialog.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EdgeInsets systemPadding =
        MediaQuery.of(context).viewPadding; // 시스템 기본 padding값 (상태바 및 SafeArea)

    double viewHeight = (MediaQuery.of(context).size.height -
            (systemPadding.top + kToolbarHeight)) *
        0.1;
    return Stack(
      alignment: const FractionalOffset(.5, 1.0),
      children: [
        Container(
          height: viewHeight,
          color: const Color.fromARGB(255, 24, 29, 54),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  createSmoothDialog(
                      context,
                      "시계 추가 버튼 눌림",
                      const Text("TODO: 작업 추가"),
                      TextButton(
                        child: const Text("확인"),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                      null,
                      false);
                },
                icon: const Icon(
                  Icons.watch_later_outlined,
                  color: Colors.white,
                ),
              ),
              const SizedBox(),
              IconButton(
                onPressed: () {
                  createSmoothDialog(
                      context,
                      "탐색 추가 버튼 눌림",
                      const Text("TODO: 작업 추가"),
                      TextButton(
                        child: const Text("확인"),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                      null,
                      false);
                },
                icon: const Icon(
                  Icons.explore_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
