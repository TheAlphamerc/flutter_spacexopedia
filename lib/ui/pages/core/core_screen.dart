import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/bloc/core/core_model.dart';
import 'package:flutter_spacexopedia/helper/utils.dart';
import 'package:flutter_spacexopedia/ui/theme/extentions.dart';

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
    final theme  = Theme.of(context);
    return Container(
       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        // boxShadow:<BoxShadow>[
        //   BoxShadow(
        //     blurRadius: 10,color: Color(0xffe9e9e9)
        //   )
        // ]
      ),
      child: Row(
        children: <Widget>[
         
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Core serial: ${model.coreSerial}",
                  style: TextStyle(color: theme.textTheme.bodyText1.color),
                ).vP4,
                Text(
                  "Status: ${model.status}",
                  style: TextStyle(color: theme.textTheme.bodyText1.color),
                ).vP4,
                Text(
                  "First flight date: ${Utils.toformattedDate(model.originalLaunch)}",
                  style: TextStyle(color: theme.textTheme.bodyText1.color),
                ).vP4,
                Text(
                  "Mission: ${model.missions.first.name}",
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
