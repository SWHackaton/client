// ignore_for_file: use_build_context_synchronously

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:mockup/main.dart';
import 'package:mockup/ui/dialog/smoothDialog.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<void> _handleLogin(String authCode) async {
    try {
      OAuthToken token =
          await AuthApi.instance.issueAccessToken(authCode: authCode);
      print("token: $token");
      FlutterSecureStorage secureStorage = getFlutterSecureStorage();
      secureStorage.write(key: KEY_KAKAO_AUTH_CODE, value: authCode);
      secureStorage.write(key: KEY_KAKAO_ACCES_TOKEN, value: token.accessToken);
      secureStorage.write(
          key: KEY_KAKAO_EXPIERS_AT, value: token.expiresAt.toString());
      secureStorage.write(key: KEY_KAKAO_ID_TOKEN, value: token.idToken);
      secureStorage.write(
          key: KEY_KAKAO_REFRESH_TOKEN, value: token.refreshToken);
      secureStorage.write(
          key: KEY_KAKAO_REFRESH_TOKEN_EXPIERS_AT,
          value: token.refreshTokenExpiresAt.toString());
      secureStorage.write(
          key: KEY_KAKAO_SCOPES, value: token.scopes.toString());

      createSmoothDialog(
          context,
          "로그인 성공",
          Text("토큰: $token\n\nauthCode: $authCode"),
          TextButton(
            child: const Text("확인"),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
          null,
          false);
      print("========================");
      print(await secureStorage.read(key: KEY_KAKAO_AUTH_CODE));
      print(await secureStorage.read(key: KEY_KAKAO_ACCES_TOKEN));
      print(await secureStorage.read(key: KEY_KAKAO_EXPIERS_AT));
      print(await secureStorage.read(key: KEY_KAKAO_ID_TOKEN));
      print(await secureStorage.read(key: KEY_KAKAO_REFRESH_TOKEN));
      print(await secureStorage.read(key: KEY_KAKAO_REFRESH_TOKEN_EXPIERS_AT));
      print(await secureStorage.read(key: KEY_KAKAO_SCOPES));

      Navigator.of(context).pop();
    } catch (error) {
      print(error.toString());
      createSmoothDialog(
          context,
          "로그인 실패",
          Text("로그인 작업이 다음 오류로 인해 실패했습니다: ${error.toString()}"),
          TextButton(
            child: const Text("확인"),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
          const Icon(Icons.warning_amber),
          false);
    }
  }

  Future<void> _loginButtonPressed() async {
    String authCode = await AuthCodeClient.instance.request();
    print(authCode);
    await _handleLogin(authCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: GoogleFonts.alegreya(),
        ),
        foregroundColor: NeumorphicColors.defaultTextColor,
        backgroundColor: NeumorphicColors.background,
        elevation: 0,
      ),
      body: NeumorphicBackground(
          child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          const Icon(FontAwesomeIcons.shoePrints, size: 32),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Text("Foot Print", style: GoogleFonts.adamina(fontSize: 32)),
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          Row(children: <Widget>[
            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
            const Expanded(child: Divider(thickness: 2)),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            const Text("어떤 계정으로 발자취를 남겨볼까요?"),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            const Expanded(child: Divider(thickness: 2)),
            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
          ]),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed: _loginButtonPressed,
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                ),
                child: const Text(
                  '카카오 계정으로 발자취 남기기',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
