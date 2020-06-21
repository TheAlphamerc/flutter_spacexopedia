import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/bloc/core/core_model.dart';
import 'package:flutter_spacexopedia/helper/utils.dart';
import 'package:flutter_spacexopedia/ui/theme/extentions.dart';
import 'package:flutter_spacexopedia/ui/widgets/list_card.dart';

class CoreScreen extends StatelessWidget {
  final List<CoreModel> list;

  const CoreScreen({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => DragonCard(
        model: list[index],
      ),
    );
  }
}

class DragonCard extends StatelessWidget {
  final CoreModel model;
  const DragonCard({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListCard(
      hideImage: true,
      bodyContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Core serial: ${model.coreSerial}",
            style: TextStyle(color: theme.textTheme.bodyText1.color),
          ),
          Text(
            "Status: ${model.status}",
            style: TextStyle(color: theme.textTheme.bodyText1.color),
          ),
          Text(
            "First flight date: ${Utils.toformattedDate(model.originalLaunch)}",
            style: TextStyle(color: theme.textTheme.bodyText1.color),
          ),
          Text(
            "Mission: ${model.missions.first.name}",
            style: TextStyle(color: theme.textTheme.bodyText1.color),
          )
        ],
      ).hP16,
    );
  }
}
