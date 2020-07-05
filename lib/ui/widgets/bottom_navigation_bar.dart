import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacexopedia/bloc/navigation/bloc.dart';
import 'package:flutter_spacexopedia/helper/app_font.dart';
import 'package:google_fonts/google_fonts.dart';

class SBottomNavigationBar extends StatelessWidget {
  const SBottomNavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pageindex = 0;
    final NavigationBloc bloc = BlocProvider.of<NavigationBloc>(context);
    final theme = Theme.of(context);
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        if (state is SelectPageIndex) {
          pageindex = state.index;
        }
        return BottomNavigationBar(
          elevation: 10,
          unselectedIconTheme:
              IconThemeData(color: theme.colorScheme.onPrimary),
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          onTap: (index) {
            bloc.add(IndexSelected(index));
          },
          showUnselectedLabels: false,
          showSelectedLabels: true,
          currentIndex: pageindex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(AppFont.launch), title: Text("Launch")),
            BottomNavigationBarItem(
                icon: Icon(AppFont.roadster), title: Text("Roadster")),
            BottomNavigationBarItem(
                icon: Icon(AppFont.rocket), title: Text("Rocket")),
            BottomNavigationBarItem(
                icon: Icon(AppFont.rocketdragon), title: Text("Dragon")),
            BottomNavigationBarItem(
                icon: Icon(AppFont.core), title: Text("Core")),
          ],
        );
      },
    );
  }
}
