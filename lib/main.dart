import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:mockup/db/dao/location.dart';
import 'package:mockup/db/dto/location.dart';
import 'package:mockup/ui/page/category.dart';
import 'package:mockup/ui/page/diary.dart';
import 'package:mockup/ui/page/login.dart';
import 'package:mockup/ui/page/main.dart';
import 'package:mockup/ui/page/review-list.dart';

void main() {
  KakaoSdk.init(
      javaScriptAppKey: "46ab0bf9a4ca217252f64b8471259e54",
      nativeAppKey: "7a8c6dda31f8b37746726b69d7a4cc4a");
  runApp(const FootPrint());
}

const secureStorage = FlutterSecureStorage();
FlutterSecureStorage getFlutterSecureStorage() {
  return secureStorage;
}

const String KEY_KAKAO_AUTH_CODE = "kakaoLoginAuthCode";
const String KEY_KAKAO_ACCES_TOKEN = "KakaoAccessToken";
const String KEY_KAKAO_EXPIERS_AT = "KakaoExpiresAt";
const String KEY_KAKAO_ID_TOKEN = "KakaoIdToken";
const String KEY_KAKAO_REFRESH_TOKEN = "KakaoRefreshToken";
const String KEY_KAKAO_REFRESH_TOKEN_EXPIERS_AT = "KakaoRefreshTokenExpiresAt";
const String KEY_KAKAO_SCOPES = "KakaoScopes";

///
/// *** 중요 ***
/// TODO: 앱 실행시 secureStorage에서 로그인값이 유효하다면 자동 로그인, 유효하지 않다몬 로그인 페이지로 넘길것
/// *** 중요 ***
///

class FootPrint extends StatelessWidget {
  const FootPrint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = "Foot Print";
    AndroidOptions _getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );
    return const NeumorphicApp(
      title: title,
      home: FootPrintPage(title: title),
      darkTheme: neumorphicDefaultTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}

class FootPrintPage extends StatefulWidget {
  const FootPrintPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<FootPrintPage> createState() => _FootPrintPageState();
}

class _FootPrintPageState extends State<FootPrintPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  GeoLocationProvider provider = GeoLocationProvider();
  final _textEditController = TextEditingController();

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
    setupDataBase();
    setGeoLocationConfig();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  void setupDataBase() async {
    await provider.open('location');
  }

  void setGeoLocationConfig() {
    bg.BackgroundGeolocation.onLocation((bg.Location location) {
      // 추적될때마다 생성.
      if (provider.db.isOpen) {
        provider.insert(GeoLocation(
            dateTime: location.timestamp,
            latitude: location.coords.latitude,
            longitude: location.coords.longitude));
      }
    }, (bg.LocationError error) {
      print("error : $error");
    });

    bg.BackgroundGeolocation.onMotionChange((bg.Location location) {
      print('[motionchange] - $location'); // 동작 변환 시 작동
    });

    bg.BackgroundGeolocation.onProviderChange((bg.ProviderChangeEvent event) {
      print('[providerchange] - $event'); // 권한 변환 시 작동
    });

    bg.BackgroundGeolocation.ready(bg.Config(
            desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
            distanceFilter: 0,
            locationUpdateInterval: 1000 * 60,
            stopOnTerminate: false,
            startOnBoot: true,
            debug: true,
            logLevel: bg.Config.LOG_LEVEL_VERBOSE))
        .then((bg.State state) {
      if (!state.enabled) {
        print(" BackgroundGeolocation.ready 시작");
        bg.BackgroundGeolocation.start();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets systemPadding = MediaQuery.of(context).viewPadding;
    double viewHeight =
        (MediaQuery.of(context).size.height - (systemPadding.top)) * 0.1;
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
        onPressed: () async {
          ///
          ///
          ///   DEBUG Purpose Only
          ///
          ///

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
          );

          // LocationClient client = LocationClient();
          // var response = await client.getAddress();
          // print(response);

          // createSmoothDialog(
          // context,
          // "일기 추가 버튼 눌림",
          // const Text("TODO: 작업 추가"),
          // TextButton(
          //   child: const Text("확인"),
          //   onPressed: () async {
          //     Navigator.pop(context);
          //   },
          // ),
          // null,
          // false);
        },
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 15, 10, 90),
        tooltip: "새 일기 추가",
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: Stack(
        alignment: const FractionalOffset(.5, 1.0),
        children: [
          Container(
            height: viewHeight,
            color: const Color.fromARGB(255, 24, 29, 54),
            child: SafeArea(
              child: TabBar(
                indicatorColor: Colors.white,
                tabs: const <Tab>[
                  Tab(
                    icon: Icon(Icons.person_add, color: Colors.white),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.directions_run,
                      color: Colors.white,
                    ),
                  ),
                  Tab(
                    icon: Icon(Icons.edit_note, color: Colors.white),
                  ),
                  Tab(
                    icon: Icon(Icons.ac_unit, color: Colors.white),
                  ),
                ],
                controller: controller,
              ),
            ),
          ),
        ],
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          const MainPage(),
          const Diary(),
          const ReviewListView(),
          const CategoryPage()
        ],
      ),
    );
  }
}
