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
    return ListTile(
      onTap: () {},
      title: Text(title),
      trailing: Text(value),
    );
  }

  Widget _heading(context, String title, ThemeData theme) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.only(bottom: 8, left: 16),
      height: 50,
      width: AppTheme.fullWidth(context),
      color: theme.appBarTheme.color,
      child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
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
                  SizedBox(height: 16),
                  ListTile(
                    title: Text("Description"),
                    subtitle: Text(
                      model.details,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(height: 16),
                  Divider(height: 0),
                  _rowTile("Flight no", "#${model.flightNumber}"),
                  Divider(height: 0),
                  _rowTile("Launch date",
                      Utils.toformattedDate2(model.launchDateLocal)),
                  Divider(height: 0),
                  _rowTile("Success", model.launchSuccess ? "Yes" : "False"),
                  Divider(height: 0),
                  _rowTile("Location", model.launchSite.siteName),
                  Divider(height: 0),
                  _rowTile("Rocket", model.rocket.rocketName),
                  Divider(height: 0),

                  /// Core
                  _heading(context, "Core #1", theme),
                  _rowTile(
                      "Serial", model.rocket.firstStage.cores.first.coreSerial),
                  Divider(height: 0),
                  _rowTile("Block", model.rocket.firstStage.cores.first.block.toString()),
                  Divider(height: 0),
                  _rowTile("Flight number","#${model.flightNumber}"),
                  Divider(height: 0),
                  _rowTile("Resued", model.rocket.firstStage.cores.first.reused ? "Yes": "No"),
                  Divider(height: 0),
                  _rowTile("Landing type", model.rocket.firstStage.cores.first.landingType),
                  Divider(height: 0),
                  _rowTile("Landing vehicle", model.rocket.firstStage.cores.first.landingVehicle),
                   Divider(height: 0),
                  _rowTile("Landing Sucess", model.rocket.firstStage.cores.first.landSuccess ? "Yes" : "No"),
                  /// Payload
                  _heading(
                      context,
                      "Payload: ${model.rocket.secondStage.payloads.first.payloadId}",
                      theme),
                  _rowTile("Customers", model.rocket.secondStage.payloads.first.customers.first),
                  Divider(height: 0),
                  _rowTile("Nationality", model.rocket.secondStage.payloads.first.nationality),
                  Divider(height: 0),
                  _rowTile("Manufacturer",model.rocket.secondStage.payloads.first.manufacturer),
                  Divider(height: 0),
                  _rowTile("Mass", model.rocket.secondStage.payloads.first.payloadMassKg.toString() + " Kg"),
                  Divider(height: 0),
                  _rowTile("Orbit", model.rocket.secondStage.payloads.first.orbit ),
                  Divider(height: 0),

                   /// Link
                  _heading(context, "Links", theme),
                  _rowTile(
                      "Mission patch", model.links.missionPatch.substring(0,30)),
                  Divider(height: 0),
                  _rowTile(
                      "Reddit campaign","www.reddit.com"),
                  Divider(height: 0),
                  _rowTile(
                      "Reddit launch", "www.reddit.com"),
                  Divider(height: 0),
                  _rowTile(
                      "Reddit recovery", "www.reddit.com"),
                  Divider(height: 0),
                  _rowTile(
                      "Reddit media", "www.reddit.com"),
                  Divider(height: 0),
                  _rowTile(
                      "Article link", model.links.articleLink.substring(0,30)),
                  Divider(height: 0),
                  _rowTile(
                      "Wikipedia", model.links.wikipedia),
                  Divider(height: 0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
