import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/bloc/dragon/dragon_model.dart';
import 'package:flutter_spacexopedia/helper/utils.dart';
import 'package:flutter_spacexopedia/ui/widgets/list_card.dart';
import 'package:flutter_spacexopedia/ui/widgets/title_text.dart';
import 'package:flutter_spacexopedia/ui/widgets/title_value.dart';

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
    return ListCard(
      imagePath: model.flickrImages?.first,
      bodyContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TitleText(model.name, fontSize:14),
          TitleValue(
            title: "Rocket Id:",
            value: "${model.id}",
          ),
          TitleValue(
            title: "First flight date:",
            value: Utils.toformattedDate(model.firstFlight),
          ),
          TitleValue(
            title: "Type:",
            value: model.type,
          ),
        ],
      ),
    );
  }
}
