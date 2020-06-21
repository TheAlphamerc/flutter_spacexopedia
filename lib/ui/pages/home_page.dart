import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacexopedia/bloc/navigation/bloc.dart';
import 'package:flutter_spacexopedia/ui/pages/core/core_page.dart';
import 'package:flutter_spacexopedia/ui/pages/dragon/dragon_page.dart';
import 'package:flutter_spacexopedia/ui/pages/launch/all_launch.dart';
import 'package:flutter_spacexopedia/ui/pages/roadster/roadster_page.dart';
import 'package:flutter_spacexopedia/ui/pages/rockets/rocket_page.dart';
import 'package:flutter_spacexopedia/ui/theme/custom_theme.dart';
import 'package:flutter_spacexopedia/ui/theme/theme.dart';
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
  bool isDarkTheme = true;
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

  void _changeTheme(BuildContext buildContext, ThemeType key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
    isDarkTheme = key == ThemeType.DARK;
    BlocProvider.of<NavigationBloc>(context).add(ThemeSelected(key));
  }

  String _getPageName(int index) {
    switch (index) {
      case 0:
        return "Launche";
      case 1:
        return "Roadster";
      case 2:
        return "Rockets";
      case 3:
        return "Dragon";
      case 4:
        return "Cores";

      default:
        return "Empty";
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        title: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            if (state is SelectPageIndex) {
              pageindex = state.index;
            }
            return Title(
              color: theme.textTheme.bodyText1.color,
              child: Text(_getPageName(pageindex)),
              title: "Title of screen",
            );
          },
        ),
        actions: <Widget>[
          BlocBuilder<NavigationBloc, NavigationState>(
              builder: (context, state) {
            if (state is SelectTheme) {
              isDarkTheme = state.type == ThemeType.DARK;
            }
            return IconButton(
              icon: Icon(isDarkTheme ? Icons.event_note : Icons.ev_station),
              onPressed: () {
                _changeTheme(
                    context, isDarkTheme ? ThemeType.LIGHT : ThemeType.DARK);
              },
            );
          }),
        ],
      ),
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
