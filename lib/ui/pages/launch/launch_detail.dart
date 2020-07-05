import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_spacexopedia/helper/utils.dart';
import 'package:flutter_spacexopedia/ui/theme/theme.dart';
import 'package:flutter_spacexopedia/bloc/launches/bloc.dart';
import 'package:flutter_spacexopedia/ui/theme/extentions.dart';
import 'package:flutter_spacexopedia/ui/pages/launch/widgets/youtube_player.dart';
import 'package:flutter_spacexopedia/ui/widgets/title_text.dart';

class LaunchDetail extends StatelessWidget {
  const LaunchDetail({Key key, this.model}) : super(key: key);
  final Launch model;

  Widget _links(
    String title,
    String value,
    int from,
    int to,
  ) {
    String url = value;
    if (value != null) {
      value = value.substring(from, to);
    } else {
      value = "N/A";
    }
    return _ListTile(title, value, onPressed: () {
      canLaunch(url).then((yes) {
        if (yes) {
          launch(url);
        }
      });
    });
  }

  Widget _heading(context, String title, ThemeData theme) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.only(bottom: 8, left: 16),
      height: 50,
      width: AppTheme.fullWidth(context),
      color: theme.colorScheme.primary.withAlpha(30),
      child: TitleText(title, fontSize: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  title: Title(
                    color: theme.backgroundColor,
                    child: Text(model.missionName),
                    title: "Title of screen",
                  ),
                  floating: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    YoutubeVideoPlayer(
                      youtubeId: model?.links?.youtubeId,
                    ),

                    SizedBox(height: model.details == null ? 0 : 16),
                    model.details == null
                        ? SizedBox.shrink()
                        : ListTile(
                            title: TitleText("Description", fontSize: 15),
                            subtitle: TitleText(
                              model.details ?? "",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.justify,
                            ).vP8,
                          ),
                    // SizedBox(height: model.details == null ? 0 : 16),
                    Divider(height: 0),
                    _ListTile("Flight no", "#${model.flightNumber}"),
                    Divider(height: 0),
                    _ListTile(
                      "Launch date",
                      Utils.toformattedDate2(model.launchDateLocal),
                    ),
                    Divider(height: 0),
                    _ListTile(
                      "Success",
                      model.launchSuccess == null
                          ? "N/A"
                          : model.launchSuccess ? "Yes" : "False",
                    ),
                    Divider(height: 0),
                    _ListTile("Location", model.launchSite.siteName),
                    Divider(height: 0),
                    _ListTile("Rocket", model.rocket.rocketName),
                    Divider(height: 0),

                    /// Core
                    _heading(context, "Core #1", theme),
                    _ListTile(
                      "Serial",
                      model.rocket.firstStage.cores.first.coreSerial,
                    ),
                    Divider(height: 0),
                    _ListTile(
                      "Block",
                      model.rocket.firstStage.cores.first.block.toString(),
                    ),
                    Divider(height: 0),
                    _ListTile("Flight number", "#${model.flightNumber}"),
                    Divider(height: 0),
                    _ListTile(
                      "Resued",
                      model.rocket.firstStage.cores.first.reused == null
                          ? "N/A"
                          : model.rocket.firstStage.cores.first.reused
                              ? "Yes"
                              : "No",
                    ),
                    Divider(height: 0),
                    _ListTile(
                      "Landing type",
                      model.rocket.firstStage.cores.first.landingType,
                    ),
                    Divider(height: 0),
                    _ListTile(
                      "Landing vehicle",
                      model.rocket.firstStage.cores.first.landingVehicle,
                    ),
                    Divider(height: 0),
                    _ListTile(
                      "Landing Sucess",
                      model.rocket.firstStage.cores.first.landSuccess == null
                          ? "N/A"
                          : model.rocket.firstStage.cores.first.landSuccess
                              ? "Yes"
                              : "No",
                    ),

                    /// Payload
                    _heading(
                      context,
                      "Payload: ${model.rocket.secondStage.payloads.first.payloadId}",
                      theme,
                    ),
                    _ListTile(
                      "Customers",
                      model.rocket.secondStage.payloads.first.customers.first,
                    ),
                    Divider(height: 0),
                    _ListTile(
                      "Nationality",
                      model.rocket.secondStage.payloads.first.nationality,
                    ),
                    Divider(height: 0),
                    _ListTile(
                      "Manufacturer",
                      model.rocket.secondStage.payloads.first.manufacturer,
                    ),
                    Divider(height: 0),
                    _ListTile(
                      "Mass",
                      model.rocket.secondStage.payloads.first.payloadMassKg ==
                              null
                          ? "N/A"
                          : model.rocket.secondStage.payloads.first
                                  .payloadMassKg
                                  .toString() +
                              " Kg",
                    ),
                    Divider(height: 0),
                    _ListTile(
                      "Orbit",
                      model.rocket.secondStage.payloads.first.orbit,
                    ),
                    Divider(height: 0),

                    /// Link
                    _heading(context, "Links", theme),
                    _links("Mission patch", model.links.missionPatch, 0, 26),
                    Divider(height: 0),
                    _links(
                        "Reddit campaign", model.links.redditCampaign, 8, 22),
                    Divider(height: 0),
                    _links("Reddit launch", model.links.redditCampaign, 8, 22),
                    Divider(height: 0),
                    _links(
                        "Reddit recovery", model.links.redditCampaign, 8, 22),
                    Divider(height: 0),
                    _links("Reddit media", model.links.redditCampaign, 8, 22),
                    Divider(height: 0),
                    _links("Article link", model.links.articleLink, 0, 26),
                    Divider(height: 0),
                    _links("Wikipedia", model.links.wikipedia, 0, 24),
                    Divider(height: 0),
                  ], addAutomaticKeepAlives: true),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile(this.title, this.value, {Key key, this.onPressed})
      : super(key: key);
  final String title;
  final String value;
  final Function onPressed;

  Widget _rowTile(String title, String value,
      {Function onPressed, ThemeData theme}) {
    if (value == null) {
      value = "N/A";
    }
    return ListTile(
      contentPadding: EdgeInsets.only(
          left: 16, top: 4, bottom: 4, right: onPressed == null ? 16 : 0),
      title: Row(
        children: <Widget>[
          Text(title,
              style: theme.textTheme.headline6
                  .copyWith(fontSize: 14, color: theme.colorScheme.onSurface)),
          Spacer(),
          Text(value,
              style: theme.textTheme.headline4
                  .copyWith(fontSize: 14, color: theme.colorScheme.onSurface)),
          onPressed != null
              ? IconButton(
                  icon: Icon(Icons.keyboard_arrow_right),
                  onPressed: onPressed,
                )
              : SizedBox()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return _rowTile(title, value, onPressed: onPressed, theme: theme);
  }
}
