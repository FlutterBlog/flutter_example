import 'package:flutter/material.dart';
import 'package:flutter_example/class/common/example_page.dart';
import 'package:flutter_example/class/pages/app_home_page.dart';
import 'package:flutter_example/class/pages/app_info_page.dart';

class ExampleHomePage extends StatelessWidget {
  final String appName;
  final List<ExamplePage>? pages;
  final List<Widget>? appBarActions;

  ExampleHomePage({
    Key? key,
    required this.pages,
    String repoUrl = 'https://www.github.com',
    String pubUrl = 'https://pub.flutter-io.cn',
    this.appName = '',
    this.appBarActions,
  }) : super(key: key) {
    pages?.add(AppInfoPage.createPage(appName, repoUrl, pubUrl));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: _createLightThemeData(),
      home: AppHomePage(
        title: '$appName example',
        pages: pages,
        appBarActions: appBarActions,
      ),
    );
  }

  ThemeData _createLightThemeData() {
    return ThemeData(
      backgroundColor: Colors.white,
      bottomAppBarColor: Colors.white,
      primarySwatch: Colors.grey,
      primaryColor: Colors.blue,
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Colors.black87,
          fontSize: 16,
          height: 1.5,
        ),
        bodyText2: TextStyle(
          color: Colors.black87,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.blueGrey,
        ),
      ),
    );
  }

  ThemeData _createDarkThemeData() {
    return ThemeData(
      backgroundColor: Colors.grey[800],
      bottomAppBarColor: Colors.black45,
      primarySwatch: Colors.grey,
      primaryColor: Colors.blue,
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
          fontSize: 16,
          height: 1.5,
        ),
        bodyText2: TextStyle(
          color: Colors.white,
          fontSize: 18,
          height: 1.5,
        ),
      ),
    );
  }
}
