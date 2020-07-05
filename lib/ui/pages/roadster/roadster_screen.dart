import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_spacexopedia/ui/theme/extentions.dart';
import 'package:flutter_spacexopedia/ui/widgets/title_text.dart';
import 'package:flutter_spacexopedia/ui/widgets/image_slider.dart';
import 'package:flutter_spacexopedia/bloc/roadster/roadster_model.dart';

class RoadsterScreen extends StatelessWidget {
  final RoadsterModel model;

  const RoadsterScreen({Key key, this.model}) : super(key: key);
    
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PhotoPageView(
              imageList: model.flickrImages,
            ),
            TitleText(model.name, fontSize:20).vP8,
            TitleText(model.details, fontSize:14, textAlign: TextAlign.justify, fontWeight: FontWeight.w400,).pO(bottom: 8,left:8,right:8),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlineButton(
                  onPressed: () {
                    launch(model.wikipedia);
                  },
                  child: TitleText("Wiki", fontSize:16),
                ),
                OutlineButton(
                  onPressed: () {
                    launch(model.video);
                  },
                  child: TitleText("Video", fontSize:16),
                ),
              ],
            ),
            Divider(),
            _RodsterListTile(
                title: "Distance", value: model.earthDistanceKm.toString()),
            _RodsterListTile(
                title: "Weight", value: model.launchMassKg.toString()),
            _RodsterListTile(
                title: "Orbit type", value: model.orbitType.toString()),
            _RodsterListTile(title: "Epoch", value: model.epochJd.toString()),
            _RodsterListTile(
                title: "ApoapsisAu", value: model.apoapsisAu.toString()),
            _RodsterListTile(
                title: "Periapsis Arg", value: model.periapsisArg.toString()),
            _RodsterListTile(
                title: "periapsis Au", value: model.periapsisAu.toString()),
            _RodsterListTile(
                title: "Semimajor Axis Au",
                value: model.semiMajorAxisAu.toString()),
            _RodsterListTile(
                title: "Eccentricity", value: model.eccentricity.toString()),
            _RodsterListTile(
                title: "Inclination", value: model.inclination.toString()),
            _RodsterListTile(
                title: "Longitude", value: model.longitude.toString()),
            _RodsterListTile(
                title: "Period Days", value: model.periodDays.toString()),
            _RodsterListTile(
                title: "Speed Kmph", value: model.speedKph.toString()),
            _RodsterListTile(
                title: "Speed Mph", value: model.speedMph.toString()),
            _RodsterListTile(
                title: "Earth Distance(Km)",
                value: model.earthDistanceKm.toString()),
            _RodsterListTile(
                title: "Earth Distance(Mi)",
                value: model.earthDistanceMi.toString()),
            _RodsterListTile(
                title: "Mars Distance(Km)",
                value: model.marsDistanceKm.toString()),
            _RodsterListTile(
                title: "Mars Distance(Mi)",
                value: model.marsDistanceMi.toString()),
          ],
        ),
      ),
    );
  }
}

class _RodsterListTile extends StatelessWidget {
  final String title, value;
  const _RodsterListTile({Key key, this.title, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TitleText(
                title,
                fontSize: 16,
                fontWeight: FontWeight.w400
              ),
              TitleText(
                value,
                fontSize: 14,
                fontWeight: FontWeight.w400
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Divider(height: 0),
        ],
      ),
    );
  }
}
