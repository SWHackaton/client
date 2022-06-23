import 'package:flutter/material.dart';

class TimeLinePage extends StatefulWidget {
  const TimeLinePage({Key? key}) : super(key: key);

  @override
  State<TimeLinePage> createState() => _TimeLinePageState();
}

enum MenuType { first, second, third }
extension ParseToString on MenuType {
  String toShortString() {
    return this.toString().split('.').last;
  }
}


class _TimeLinePageState extends State<TimeLinePage> {
  var _dropdownValue;

  void initState() {
    super.initState();
    _dropdownValue = MenuType.first;
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: Colors.white,
    //   child: Center(
    //       child: Text("hello")
    //   ),
    // );
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          DropdownButton(
            value: _dropdownValue,
            items: MenuType.values
                .map((value) =>
                DropdownMenuItem(
                  value: value,
                  child: Text(value.toShortString()),
                ))
                .toList(),
            onChanged: (newValue) {
              setState(() {
                _dropdownValue = newValue;
              });
            },
            elevation: 4,
          )
        ],
      ),
    );
  }
}
