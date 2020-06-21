import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/bloc/rocket/rocket_model.dart';
import 'package:flutter_spacexopedia/helper/utils.dart';
import 'package:flutter_spacexopedia/ui/widgets/customWidgets.dart';
import 'package:flutter_spacexopedia/ui/widgets/list_card.dart';

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
    final theme = Theme.of(context);
    return ListCard(
      imagePath: model.flickrImages.first,
      bodyContent: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            model.rocketName,
            style: TextStyle(color: theme.textTheme.bodyText1.color),
          ),
          Text(
            "Rocket Id: ${model.rocketId}",
            style: TextStyle(color: theme.textTheme.bodyText1.color),
          ),
          Text(
            "First flight date: ${Utils.toformattedDate(model.firstFlight)}",
            style: TextStyle(color: theme.textTheme.bodyText1.color),
          ),
          Text(
            "company: ${model.company}",
            style: TextStyle(color: theme.textTheme.bodyText1.color),
          )
        ],
      ),
    );
  }
}
