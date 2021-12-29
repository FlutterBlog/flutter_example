import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/class/common/example_page.dart';
import 'package:flutter_example/class/common/global.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class AppInfoPage extends StatelessWidget {
  static ExamplePage createPage(
    String appName,
    String repoUrl,
    String pubUrl,
  ) {
    return ExamplePage(
      Icons.info_outline,
      (context) => AppInfoPage(
        appName: appName,
        repoUrl: repoUrl,
        pubUrl: pubUrl,
      ),
    );
  }

  final String appName;
  final String repoUrl;
  final String pubUrl;

  const AppInfoPage({
    Key? key,
    required this.appName,
    required this.repoUrl,
    required this.pubUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Padding(
            padding: defaultVerticalPadding + defaultHorizontalPadding,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(bottom: 56)),
                Text(
                  'This app is example for $appName plugin. \n'
                  'This plugin is open source project on Github. \n'
                  '\n'
                  'Contact at connyyue@gmail.com\n',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                _launcherRaisedButton(
                  'Goto Github',
                  repoUrl,
                  context,
                ),
                _launcherRaisedButton(
                  'Goto Pub',
                  pubUrl,
                  context,
                ),
                const Padding(padding: EdgeInsets.only(bottom: 56)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _launcherRaisedButton(String text, String url, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.only(top: 24.0),
      alignment: Alignment.center,
      child: SizedBox.expand(
        child: TextButton(
          child: Text(text),
          onPressed: () => _launchURL(url),
          clipBehavior: Clip.none,
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
