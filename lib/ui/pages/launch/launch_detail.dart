import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/bloc/launches/bloc.dart';
import 'package:flutter_spacexopedia/helper/utils.dart';
import 'package:flutter_spacexopedia/ui/pages/launch/widgets/youtube_player.dart';
import 'package:flutter_spacexopedia/ui/theme/theme.dart';

class LaunchDetail extends StatelessWidget {
  const LaunchDetail({Key key, this.model}) : super(key: key);
  final Launch model;
  Widget _rowTile(String title, String value,
      {bool isNavigate, Function onPressed}) {
    // return Row(
    //   children: <Widget>[
    //     Text(title),
    //     Spacer(),
    //     Text(value),
    //   ],
    // );

    return ListTile(
      onTap: () {},
      title: Text(title),
      trailing: Text(value),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: theme.textTheme.bodyText1.color,
          child: Text(model.missionName),
          title: "Title of screen",
        ),
      ),
      body: Column(
        children: <Widget>[
          YoutubeVideoPlayer(
            youtubeId: model?.links?.youtubeId,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height:16),
                  ListTile(
                    title:Text("Description"),
                    subtitle: Text(model.details,textAlign: TextAlign.justify,),
                  ),
                  SizedBox(height:16),
                  Divider(height: 0),
                  _rowTile("Flight no", model.flightNumber.toString()),
                  Divider(height: 0),
                  _rowTile("Launch date",
                      Utils.toformattedDate(model.launchDateLocal)),
                  Divider(height: 0),
                  _rowTile("Success", model.launchSuccess.toString()),
                  Divider(height: 0),
                  _rowTile("Location", model.launchSite.siteName.toString()),
                  Divider(height: 0),
                  _rowTile("Rocket", model.rocket.rocketName.toString()),
                  Divider(height: 0),
                  Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(bottom:8, left:16),
                      height: 50,
                      width: AppTheme.fullWidth(context),
                      color: theme.appBarTheme.color,
                      child: Text("Core #1", style:TextStyle(fontWeight:FontWeight.bold)),
                    ),
                  _rowTile("Serial", model.toString()),
                  Divider(height: 0),
                  _rowTile("Core #1", model.flightNumber.toString()),
                  Divider(height: 0),
                  _rowTile("Core #1", model.flightNumber.toString()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
