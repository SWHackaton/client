import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mockup/ui/page/uipage/TimeLinePage.dart';
import 'package:mockup/ui/page/uipage/CategoriesPage.dart';
import 'package:mockup/ui/page/uipage/DiaryPage.dart';
import 'package:mockup/ui/page/uipage/LocationPage.dart';

import '../dialog/smoothDialog.dart';
import '../widget/bottomNavigationBar.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("hello",),
        backgroundColor: Colors.white30,
      ),
      body: TabBarView(
        children: <Widget>[TimeLinePage(),DiaryPage(),LocationPage(),CategoriesPage()],
      controller:  controller,
      ),
      // bottomNavigationBar: const CustomBottomNavigationBar()
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 24, 29, 54),
        child: TabBar(
          indicatorColor: Colors.white,
          tabs: const <Tab>[
            Tab(icon: Icon(Icons.person_add, color: Colors.white)),
            Tab(icon: Icon(Icons.directions_run, color: Colors.white,)),
            Tab(icon: Icon(Icons.edit_note, color: Colors.white)),
            Tab(icon: Icon(Icons.ac_unit, color: Colors.white)),
          ], controller: controller,
        ),
      ),
    );

  }

  void initState(){
    super.initState();
    controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  void dispose(){
    controller!.dispose();
    super.dispose();
  }
}




