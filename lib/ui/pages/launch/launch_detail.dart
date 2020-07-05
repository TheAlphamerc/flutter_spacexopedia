import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/ui/widgets/custom_heading_tile.dart';
import 'package:flutter_spacexopedia/ui/widgets/custom_list_tile.dart';
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
    return SListTile(title, value, onPressed: () {
      canLaunch(url).then((yes) {
        if (yes) {
          launch(url);
        }
      });
    });
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
                    title: model.missionName,
                  ),
                  floating: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
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
                      SListTile("Flight no", "#${model.flightNumber}"),
                      Divider(height: 0),
                      SListTile(
                        "Launch date",
                        Utils.toformattedDate2(model.launchDateLocal),
                      ),
                      Divider(height: 0),
                      SListTile(
                        "Success",
                        model.launchSuccess == null
                            ? "N/A"
                            : model.launchSuccess ? "Yes" : "False",
                      ),
                      Divider(height: 0),
                      SListTile("Location", model.launchSite.siteName),
                      Divider(height: 0),
                      SListTile("Rocket", model.rocket.rocketName),
                      Divider(height: 0),

                      /// Core
                      SHeadingTile("Core #1"),
                      SListTile(
                        "Serial",
                        model.rocket.firstStage.cores.first.coreSerial,
                      ),
                      Divider(height: 0),
                      SListTile(
                        "Block",
                        model.rocket.firstStage.cores.first.block.toString(),
                      ),
                      Divider(height: 0),
                      SListTile("Flight number", "#${model.flightNumber}"),
                      Divider(height: 0),
                      SListTile(
                        "Resued",
                        model.rocket.firstStage.cores.first.reused == null
                            ? "N/A"
                            : model.rocket.firstStage.cores.first.reused
                                ? "Yes"
                                : "No",
                      ),
                      Divider(height: 0),
                      SListTile(
                        "Landing type",
                        model.rocket.firstStage.cores.first.landingType,
                      ),
                      Divider(height: 0),
                      SListTile(
                        "Landing vehicle",
                        model.rocket.firstStage.cores.first.landingVehicle,
                      ),
                      Divider(height: 0),
                      SListTile(
                        "Landing Sucess",
                        model.rocket.firstStage.cores.first.landSuccess == null
                            ? "N/A"
                            : model.rocket.firstStage.cores.first.landSuccess
                                ? "Yes"
                                : "No",
                      ),

                      /// Payload
                      SHeadingTile(
                        "Payload: ${model.rocket.secondStage.payloads.first.payloadId}",
                      ),
                      SListTile(
                        "Customers",
                        model.rocket.secondStage.payloads.first.customers.first,
                      ),
                      Divider(height: 0),
                      SListTile(
                        "Nationality",
                        model.rocket.secondStage.payloads.first.nationality,
                      ),
                      Divider(height: 0),
                      SListTile(
                        "Manufacturer",
                        model.rocket.secondStage.payloads.first.manufacturer,
                      ),
                      Divider(height: 0),
                      SListTile(
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
                      SListTile(
                        "Orbit",
                        model.rocket.secondStage.payloads.first.orbit,
                      ),
                      Divider(height: 0),

                      /// Link
                      SHeadingTile("Links"),
                      _links("Mission patch", model.links.missionPatch, 0, 26),
                      Divider(height: 0),
                      _links(
                          "Reddit campaign", model.links.redditCampaign, 8, 22),
                      Divider(height: 0),
                      _links(
                          "Reddit launch", model.links.redditCampaign, 8, 22),
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
                    ],
                    addAutomaticKeepAlives: true,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
