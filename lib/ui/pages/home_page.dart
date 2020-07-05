import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacexopedia/bloc/navigation/bloc.dart';
import 'package:flutter_spacexopedia/helper/app_font.dart';
import 'package:flutter_spacexopedia/helper/utils.dart';
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
        return "Launch";
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
              color: theme.colorScheme.onSurface,
              child: Text(_getPageName(pageindex)),
              title: "Spacexopedia",
            );
          },
        ),
        // iconTheme: ,
        actions: <Widget>[
          BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, state) {
              if (state is SelectTheme) {
                isDarkTheme = state.type == ThemeType.DARK;
              }
              return IconButton(
                icon: Icon(
                  isDarkTheme ? AppFont.sun : AppFont.moon,
                ),
                onPressed: () {
                  _changeTheme(
                      context, isDarkTheme ? ThemeType.LIGHT : ThemeType.DARK);
                },
              );
            },
          ),
          PopupMenuButton<Choice>(
            onSelected: (choice) async {
              switch (choice.title) {
                case "Share":
                  Utils.launchTo(
                      "https://play.google.com/store/apps/details?id=com.thealphamerc.flutter_spacexopedia");
                  break;
                case "About":
                  break;
                case "License":
                  showLicensePage(
                      context: context,
                      applicationName: "Spacexopedia",
                      applicationVersion: "1.0.0",
                      useRootNavigator: false,
                      applicationLegalese: "By TheAlphamerc");

                  break;

                default:
              }
            },
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          ),
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

class Choice {
  const Choice({this.title, this.icon});

  final IconData icon;
  final String title;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Share', icon: Icons.directions_car),
  const Choice(title: 'About', icon: Icons.directions_railway),
  const Choice(title: 'License', icon: Icons.directions_railway),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              choice.title,
              style:
                  TextStyle(fontSize: 20, color: theme.colorScheme.onSurface),
            ),
          ],
        ),
      ),
    );
  }
}
