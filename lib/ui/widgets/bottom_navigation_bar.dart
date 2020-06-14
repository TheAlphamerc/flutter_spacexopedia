import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacexopedia/bloc/navigation/bloc.dart';

class SBottomNavigationBar extends StatelessWidget {
  const SBottomNavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationBloc counterBloc = BlocProvider.of<NavigationBloc>(context);

    return BottomNavigationBar(
      fixedColor: Colors.black54,
      unselectedItemColor: Colors.black45,
      type: BottomNavigationBarType.fixed,
      // showSelectedLabels: false,
      onTap: (index) {
        counterBloc.add(IndexSelected(index));
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance), title: Text("Launch")),
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
  }
}
