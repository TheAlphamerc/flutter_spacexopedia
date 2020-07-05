import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/bloc/dragon/dragon_model.dart';
import 'package:flutter_spacexopedia/helper/utils.dart';
import 'package:flutter_spacexopedia/ui/theme/extentions.dart';
import 'package:flutter_spacexopedia/ui/widgets/custom_heading_tile.dart';
import 'package:flutter_spacexopedia/ui/widgets/custom_list_tile.dart';
import 'package:flutter_spacexopedia/ui/widgets/image_slider.dart';
import 'package:flutter_spacexopedia/ui/widgets/title_text.dart';
import 'package:url_launcher/url_launcher.dart';

class DragonDetail extends StatelessWidget {
  const DragonDetail({Key key, this.model}) : super(key: key);
  final DragonModel model;
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
                    child: Text(model.name),
                    title: model.name,
                  ),
                  pinned: true,
                  stretch: true,
                  expandedHeight: 260,
                  flexibleSpace: PhotoPageView(
                    imageList: model.flickrImages,
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: model.description == null ? 0 : 16),
                      model.description == null
                          ? SizedBox.shrink()
                          : ListTile(
                              title: TitleText("Description", fontSize: 15),
                              subtitle: TitleText(
                                model.description ?? "",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.justify,
                              ).vP8,
                            ),
                      SizedBox(height: 10),
                      Divider(height: 0),
                      SHeadingTile("Basic info"),
                      SListTile("Name", model.name),
                      Divider(height: 0),
                      SListTile("Type", model.type),
                      Divider(height: 0),
                      SListTile("Diameter", "${model.diameter.meters} m"),
                      Divider(height: 0),
                      SListTile("Height", "${model.heightWTrunk.meters} m"),
                      Divider(height: 0),
                      SListTile("Weight", "${model.dryMassKg} Kg"),
                      Divider(height: 0),
                      SListTile("First flight on",
                          "${Utils.toformattedDate(model.firstFlight)}"),
                      Divider(height: 0),
                      SListTile("Crew Capicity", "${model.crewCapacity}"),
                      Divider(height: 0),
                      SListTile(
                        "Orbit duration",
                        "${model.orbitDurationYr} yr",
                      ),
                      SListTile("Launch payload mass",
                          "${model.launchPayloadMass.kg} Kg"),
                      Divider(height: 0),
                      SListTile("Return payload mass",
                          "${model.returnPayloadMass.kg} Kg"),
                      Divider(height: 0),
                      SListTile("Launch payload volume",
                          "${model.launchPayloadVol.cubicMeters} cubic meter"),
                      Divider(height: 0),
                      SListTile("Return  payload mass",
                          "${model.returnPayloadVol.cubicMeters} cubic meter"),
                      Divider(height: 0),
                      _links("Wiki", model.wikipedia,0,24),
                      // Divider(height: 0),
                      SHeadingTile("Heat shield"),
                      SListTile("Material", model.heatShield.material),
                      Divider(height: 0),
                      SListTile("Size", "${model.heatShield.sizeMeters} m"),
                      Divider(height: 0),
                      SListTile(
                        "Temprature",
                        "${model.heatShield.tempDegrees} degree",
                      ),
                      Divider(height: 0),
                      SListTile("Partner", "${model.heatShield.devPartner}"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
