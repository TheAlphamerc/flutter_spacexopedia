import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacexopedia/bloc/navigation/bloc.dart';

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
          selectedIconTheme: IconThemeData(
              // color: theme.colorScheme.secondary,
              ),
          type: BottomNavigationBarType.fixed,
          // selectedLabelStyle: TextStyle(color:theme.colorScheme.secondary, fontWeight: FontWeight.bold),
          unselectedLabelStyle:
              TextStyle(color: theme.primaryColor, fontWeight: FontWeight.bold),
          onTap: (index) {
            bloc.add(IndexSelected(index));
          },
          currentIndex: pageindex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance),
                title: Text(
                  "Launch",
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance), title: Text("Roadster")),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance), title: Text("Rocket")),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance), title: Text("Dragon")),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance), title: Text("Core")),
          ],
        );
      },
    );
  }
}
