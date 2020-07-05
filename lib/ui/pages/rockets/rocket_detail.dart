import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/bloc/rocket/rocket_model.dart';
import 'package:flutter_spacexopedia/ui/theme/extentions.dart';
import 'package:flutter_spacexopedia/ui/widgets/custom_heading_tile.dart';
import 'package:flutter_spacexopedia/ui/widgets/custom_list_tile.dart';
import 'package:flutter_spacexopedia/ui/widgets/image_slider.dart';
import 'package:flutter_spacexopedia/ui/widgets/title_text.dart';

class RocketDetail extends StatelessWidget {
  const RocketDetail({Key key, this.model}) : super(key: key);
  final RocketModel model;

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
                    child: Text(model.rocketName),
                    title: model.rocketName,
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
                      SListTile("Name", model.rocketName),
                      Divider(height: 0),
                      SListTile("Layout", model.engines.layout),
                      Divider(height: 0),
                      SListTile("Diameter", "${model.diameter.meters} m"),
                      Divider(height: 0),
                      SListTile("Height", "${model.height.meters} m"),
                      Divider(height: 0),
                      SListTile("Weight", "${model.mass.kg} Kg"),
                      Divider(height: 0),
                      SListTile("Engines", "${model.engines.number}"),
                      Divider(height: 0),
                      SListTile("Landing legs", "${model.landingLegs.number}"),
                      Divider(height: 0),
                      SListTile(
                        "Landing legs material",
                        "${model.landingLegs.material}",
                      ),
                      Divider(height: 0),
                      SListTile("Boosters", model.boosters.toString()),
                      Divider(height: 0),
                      SListTile("Sucess rate", "${model.successRatePct} %"),
                      Divider(height: 0),
                      SListTile(
                        "Cost per launch",
                        model.costPerLaunch.toString(),
                      ),
                      SHeadingTile("Engine"),
                      Divider(height: 0),
                      SListTile("Type ", "${model.engines.type}"),
                      Divider(height: 0),
                      SListTile("Version", "${model.engines.version}"),
                      Divider(height: 0),
                      SListTile("Layout", "${model.engines.layout}"),
                      Divider(height: 0),
                      SListTile("Propellant 1", "${model.engines.propellant1}"),
                      Divider(height: 0),
                      SListTile("Propellant 1", "${model.engines.propellant2}"),
                      Divider(height: 0),
                      SListTile(
                        "Thrust sea level",
                        "${model.engines.thrustSeaLevel.kN} Kn",
                      ),
                      Divider(height: 0),
                      SListTile(
                        "Thrust to weight",
                        "${model.engines.thrustToWeight}",
                      ),
                      Divider(height: 0),
                      SListTile(
                        "Thrust to vaccum",
                        "${model.engines.thrustVacuum.kN} Kn",
                      ),
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
