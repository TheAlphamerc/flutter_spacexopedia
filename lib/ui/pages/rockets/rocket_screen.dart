import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/bloc/rocket/rocket_model.dart';
import 'package:flutter_spacexopedia/helper/utils.dart';
import 'package:flutter_spacexopedia/ui/pages/rockets/rocket_detail.dart';
import 'package:flutter_spacexopedia/ui/widgets/list_card.dart';
import 'package:flutter_spacexopedia/ui/widgets/title_text.dart';
import 'package:flutter_spacexopedia/ui/widgets/title_value.dart';

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
    return ListCard(
      imagePath: model.flickrImages.first,
      onPressed: () {
        Navigator.push(context,MaterialPageRoute(builder: (_) => RocketDetail(model: model,)));
      },
      bodyContent: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TitleText(model.rocketName, fontSize:14),
          TitleValue(
            title: "Rocket Id:",
            value: model.rocketId,
          ),
          TitleValue(
            title: "First flight date:",
            value: Utils.toformattedDate(model.firstFlight),
          ),
          TitleValue(
            title: "company:",
            value: model.company,
          ),
        ],
      ),
    );
  }
}
