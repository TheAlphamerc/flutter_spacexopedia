import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/bloc/dragon/dragon_model.dart';
import 'package:flutter_spacexopedia/helper/utils.dart';
import 'package:flutter_spacexopedia/ui/widgets/customWidgets.dart';
import 'package:flutter_spacexopedia/ui/theme/extentions.dart';

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
    final theme  = Theme.of(context);
    return Container(
       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        // boxShadow:<BoxShadow>[
        //   BoxShadow(
        //     blurRadius: 10,color: theme.colorScheme.background
        //   )
        // ]
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
                  model.name,
                  style: TextStyle(color: theme.textTheme.bodyText1.color),
                ).vP4,
                Text(
                  "Rocket Id: ${model.id}",
                  style: TextStyle(color: theme.textTheme.bodyText1.color),
                ).vP4,
                Text(
                  "First flight date: ${Utils.toformattedDate(model.firstFlight)}",
                  style: TextStyle(color: theme.textTheme.bodyText1.color),
                ).vP4,
                Text(
                  "Type: ${model.type}",
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