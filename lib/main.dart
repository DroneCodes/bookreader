import 'package:bookreader/pages/drawer_page.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Book Reader',
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: CupertinoColors.lightBackgroundGray,
        barBackgroundColor: CupertinoColors.lightBackgroundGray,
      ),
      debugShowCheckedModeBanner: false,
      home: DrawerPage(),
    );
  }
}

