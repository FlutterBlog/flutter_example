import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/class/common/example_page.dart';

// ignore: must_be_immutable
class AppHomePage extends StatefulWidget {
  String title = "";
  List<ExamplePage>? pages;
  List<Widget>? appBarActions;

  AppHomePage({
    Key? key,
    required this.pages,
    this.title = "",
    this.appBarActions,
  }) : super(key: key);

  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  static final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageWidgets = widget.pages?.map((e) => e.pageBuilder(context)).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        actions: _currentPage == 0 ? widget.appBarActions : null,
        title: Center(
          child: Text(widget.title),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: PageView(
        controller: _pageController,
        children: pageWidgets ?? [],
        onPageChanged: (page) {
          setState(() {
            _currentPage = page;
          });
        },
      ),
      bottomNavigationBar: _bottomAppBar(),
    );
  }

  BottomAppBar _bottomAppBar() {
    return BottomAppBar(
      elevation: 5,
      color: Theme.of(context).bottomAppBarColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _bottomAppRowList(),
      ),
    );
  }

  List<Widget> _bottomAppRowList() {
    if (widget.pages == null) {
      return [];
    }

    return List.unmodifiable(() sync* {
      int pageNum = widget.pages?.length ?? 0;
      for (var i = 0; i < pageNum; i++) {
        yield Expanded(
          child: IconButton(
            iconSize: 30,
            icon: Icon(widget.pages?[i].icon),
            color: _bottomAppBarIconColor(i),
            onPressed: () => _animateToPage(i),
          ),
        );
      }
    }());
  }

  void _animateToPage(int page) {
    _pageController.animateToPage(
      page,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
    );
  }

  Color _bottomAppBarIconColor(int page) {
    return _currentPage == page ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.secondary;
  }
}
