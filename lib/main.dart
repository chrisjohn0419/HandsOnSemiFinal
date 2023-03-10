import 'package:flutter/material.dart';
import 'package:hand_on/viewpage/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Hands On Activity',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

