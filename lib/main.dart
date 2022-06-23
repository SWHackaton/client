import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mockup/db/dao/location.dart';
import 'package:mockup/db/dto/location.dart';
import 'package:mockup/ui/dialog/smoothDialog.dart';
import 'package:mockup/ui/page/main.dart';
import 'package:mockup/ui/page/uipage/TimeLinePage.dart';
import 'package:mockup/ui/widget/bottomNavigationBar.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart' as bg;

void main() {
  runApp(MaterialApp(home: MainPage()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NeumorphicApp(
      title: 'Foot Print',
      home: MyHomePage(title: 'Foot Print'),
      darkTheme: neumorphicDefaultTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GeoLocationProvider provider;
  late GeoLocation geoLocation;
  var _latitude;
  var _longitude;

  @override
  void initState() {
    super.initState();
    provider = GeoLocationProvider();
    provider.open('location');

    bg.BackgroundGeolocation.onLocation((bg.Location location) { // 추적될때마다 생성.
      provider.insert(GeoLocation(dateTime: location.timestamp, latitude: location.coords.latitude, longitude: location.coords.longitude));
      print("@onLocation@ ${provider}");
    }, (bg.LocationError error) { print("error : $error"); });

    bg.BackgroundGeolocation.onMotionChange((bg.Location location) {
      print('[motionchange] - $location'); // 동작 변환 시 작동
      setState((){
        _latitude = location.coords.latitude;
        _longitude = location.coords.longitude;

      });
    });

    bg.BackgroundGeolocation.onProviderChange((bg.ProviderChangeEvent event) {
      print('[providerchange] - $event'); // 권한 변환 시 작동
    });

    bg.BackgroundGeolocation.ready(bg.Config(
        desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
        distanceFilter: 0,
        locationUpdateInterval: 5000, //10초에한번씩
        stopOnTerminate: false,
        startOnBoot: true,
        debug: true,
        logLevel: bg.Config.LOG_LEVEL_VERBOSE
    )).then((bg.State state) {
      if (!state.enabled) {
        print(" BackgroundGeolocation.ready 시작");
        bg.BackgroundGeolocation.start();
      }
    });

  }


  //
  // startLocation() {
  //   provider = GeoLocationProvider();
  //   provider.open('location');
  //
  //   bg.BackgroundGeolocation.onLocation((bg.Location location) {// 추적될때마다 생성.
  //     print("BackgroundGeolocation.onLocation start");
  //     provider.insert(GeoLocation(dateTime: location.timestamp,
  //         latitude: location.coords.latitude,
  //         longitude: location.coords.longitude));
  //   }, (bg.LocationError error) {
  //     print("error : $error");
  //   });
  //
  //   bg.BackgroundGeolocation.onMotionChange((bg.Location location) { //앱이 다시 시작됐을때 수행
  //     print('[motionchange] - $location'); // 동작 변환 시 작동
  //     setState(() {
  //       _latitude = location.coords.latitude;
  //       _longitude = location.coords.longitude;
  //     });
  //   });
  //
  //   bg.BackgroundGeolocation.onProviderChange((bg.ProviderChangeEvent event) {
  //     print('[providerchange] - $event'); // 권한 변환 시 작동
  //   });
  //
  //   print("BackgroundGeolocation.ready : 시작!");
  //   bg.BackgroundGeolocation.ready(bg.Config(
  //       desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
  //       distanceFilter: 0,
  //       locationUpdateInterval: 5000,
  //       //10초에한번씩
  //       stopOnTerminate: false,
  //       startOnBoot: true,
  //       debug: true,
  //       logLevel: bg.Config.LOG_LEVEL_VERBOSE
  //   )).then((bg.State state) {
  //     if (!state.enabled) {
  //       print(" if BackgroundGeolocation.ready 시작");
  //       bg.BackgroundGeolocation.start();
  //     }
  //     else
  //       print(" else BackgroundGeolocation.ready 시작");
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.alegreya(),
        ),
        foregroundColor: NeumorphicColors.defaultTextColor,
        backgroundColor: NeumorphicColors.background,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        // ignore: avoid_print
        onPressed: () {
          createSmoothDialog(
              context,
              "일기 추가 버튼 눌림",
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
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 24, 29, 54),
        tooltip: "새 일기 추가",
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      // body: const MainPage(),
      body : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$_latitude , $_longitude"),
            TextButton(
                onPressed: (){
                  TimeLinePage();
                },
                child: Text("push"))
          ],
        ),
      )
    );
  }
}
