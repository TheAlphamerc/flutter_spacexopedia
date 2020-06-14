import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacexopedia/bloc/launches/bloc.dart';

class AllLaunch extends StatelessWidget {
  const AllLaunch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaunchBloc, LaunchState>(
      builder: (context, state) {
        if (state is Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadedState) {
          if (state.allLaunch == null) {
            return Container(
              child: Text("Data loaded"),
            );
          } else {
            return ListView.builder(
              itemCount: state.allLaunch.length,
              itemBuilder: (context, index) {
                return Text(
                  state.allLaunch[index].missionName,
                  style: TextStyle(color: Colors.black45),
                );
              },
            );
          }
        } else {
          return Text("Error");
        }
      },
    );
  }
}
