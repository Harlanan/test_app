import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'NavigationHomeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    // 仅支持竖屏
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // 去掉右上角debug
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigationHomeScreen(),
    );
  }
}



// 将十六进制颜色字符串转换为 Color 对象  Color color = HexColor("#FF00FF");
class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
