import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/bloc/core/core_model.dart';
import 'package:flutter_spacexopedia/helper/utils.dart';
import 'package:flutter_spacexopedia/ui/theme/extentions.dart';
import 'package:flutter_spacexopedia/ui/widgets/list_card.dart';
import 'package:flutter_spacexopedia/ui/widgets/title_value.dart';

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
    return ListCard(
      hideImage: true,
      bodyContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TitleValue(
            title: "Mission:",
            value: model.missions.first.name,
          ),
          TitleValue(
            title: "Core serial:",
            value: model.coreSerial,
          ),
          TitleValue(
            title: "Original Launch date:",
            value: Utils.toformattedDate(model.originalLaunch),
          ),
          TitleValue(
            title: "Status:",
            value: model.getStatus(),
          ),
          TitleValue(
            title: "Reuse count:",
            value: model.reuseCount.toString(),
          ),
          TitleValue(
            title: "Water landing:",
            value: model.waterLanding ? "Yes" : "No",
          ),
        ],
      ).hP16,
    );
  }
}
