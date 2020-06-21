import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/bloc/dragon/dragon_model.dart';
import 'package:flutter_spacexopedia/helper/utils.dart';
import 'package:flutter_spacexopedia/ui/widgets/customWidgets.dart';
import 'package:flutter_spacexopedia/ui/theme/extentions.dart';
import 'package:flutter_spacexopedia/ui/widgets/list_card.dart';

class DragonScreen extends StatelessWidget {
  final List<DragonModel> dragonList;

  const DragonScreen({Key key, this.dragonList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dragonList.length,
      itemBuilder: (context, index) => DragonCard(
        model: dragonList[index],
      ),
    );
  }
}

class DragonCard extends StatelessWidget {
  final DragonModel model;
  const DragonCard({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListCard(
      imagePath: model.flickrImages?.first,
      bodyContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            model.name,
            style: TextStyle(color: theme.textTheme.bodyText1.color),
          ),
          Text(
            "Rocket Id: ${model.id}",
            style: TextStyle(color: theme.textTheme.bodyText1.color),
          ),
          Text(
            "First flight date: ${Utils.toformattedDate(model.firstFlight)}",
            style: TextStyle(color: theme.textTheme.bodyText1.color),
          ),
          Text(
            "Type: ${model.type}",
            style: TextStyle(color: theme.textTheme.bodyText1.color),
          )
        ],
      ),
    );
  }
}
