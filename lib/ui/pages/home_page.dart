import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacexopedia/bloc/navigation/bloc.dart';
import 'package:flutter_spacexopedia/ui/pages/core/core_page.dart';
import 'package:flutter_spacexopedia/ui/pages/dragon/dragon_page.dart';
import 'package:flutter_spacexopedia/ui/pages/launch/all_launch.dart';
import 'package:flutter_spacexopedia/ui/pages/roadster/roadster_page.dart';
import 'package:flutter_spacexopedia/ui/pages/rockets/rocket_page.dart';
import 'package:flutter_spacexopedia/ui/widgets/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageindex = 0;

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return AllLaunch();
      case 1:
        return RoadsterPage();
      case 2:
        return RocketPage();
      case 3:
        return DragonPage();
      case 4:
        return CorePage();
      default:
        return Center(child: Text("Page $pageindex"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      bottomNavigationBar: SBottomNavigationBar(),
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is SelectPageIndex) {
            pageindex = state.index;
          }
          return getPage(pageindex);
        },
      ),
    );
  }
}
