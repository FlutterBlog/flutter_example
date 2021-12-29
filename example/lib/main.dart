import 'package:flutter/material.dart';
import 'package:flutter_example/flutter_example.dart';

void main() {
  runApp(
    ExampleHomePage(
      appName: 'Example',
      pages: [
        TestPage.createPage(),
      ],
    ),
  );
}

class TestPage extends StatelessWidget {
  static ExamplePage createPage() {
    return ExamplePage(Icons.text_fields, (context) => const TestPage());
  }

  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text('TestPage'),
        ],
      ),
    );
  }
}
