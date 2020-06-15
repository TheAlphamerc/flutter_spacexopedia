import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/bloc/rocket/rocket_model.dart';
import 'package:flutter_spacexopedia/ui/theme/light_color.dart';

class RocketScreen extends StatelessWidget {
 
  final List<RocketModel> rockets;

  const RocketScreen({Key key, this.rockets}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rockets.length,
      itemBuilder: (context, index) => RocketCard(
        model: rockets[index],
      ),
    );
  }
}

class RocketCard extends StatelessWidget {
  final RocketModel model;
  const RocketCard({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(model.rocketName ?? "",style:TextStyle(color: LightColor.black)),
    );
  }
}