import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/bloc/rocket/rocket_model.dart';
import 'package:flutter_spacexopedia/helper/utils.dart';
import 'package:flutter_spacexopedia/ui/theme/extentions.dart';
import 'package:flutter_spacexopedia/ui/widgets/customWidgets.dart';

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
     final theme  = Theme.of(context);
    return Container(
       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color:theme.cardColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: model.flickrImages!= null &&
                    
                    model.flickrImages.isNotEmpty
                ? customNetworkImage(model.flickrImages.first,
                    fit: BoxFit.fill)
                : SizedBox(),
          ),
          SizedBox(width: 16,),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  model.rocketName,
                  style: TextStyle(color: theme.textTheme.bodyText1.color),
                ).vP4,
                Text(
                  "Rocket Id: ${model.rocketId}",
                  style: TextStyle(color: theme.textTheme.bodyText1.color),
                ).vP4,
                Text(
                  "First flight date: ${Utils.toformattedDate(model.firstFlight)}",
                  style: TextStyle(color: theme.textTheme.bodyText1.color),
                ).vP4,
                Text(
                  "company: ${model.company}",
                  style: TextStyle(color: theme.textTheme.bodyText1.color),
                ).vP4
              ],
            ),
          )
        ],
      ),
    );
  }
}