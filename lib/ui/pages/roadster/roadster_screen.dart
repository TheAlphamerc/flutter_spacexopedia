import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/bloc/roadster/roadster_model.dart';
import 'package:flutter_spacexopedia/ui/widgets/image_slider.dart';
import 'package:flutter_spacexopedia/ui/theme/extentions.dart';
import 'package:url_launcher/url_launcher.dart';

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
            Text(
              model.name,
              style: Theme.of(context)
                  .typography
                  .dense
                  .headline5
                  .copyWith(color: Colors.black87),
            ).vP8,
            Text(
              model.details,
              style: Theme.of(context)
                  .typography
                  .black
                  .headline5
                  .copyWith(color: Colors.black87),
              textAlign: TextAlign.justify,
            ).p(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    launch(model.wikipedia);
                  },
                  child: Text("Wiki"),
                ),
                RaisedButton(
                  onPressed: () {
                    launch(model.video);
                  },
                  child: Text("Video"),
                ),
              ],
            ),
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
                title: "Earth Distance(Mi)",
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
              Text(
                title,
                style: Theme.of(context)
                    .typography
                    .tall
                    .headline6
                    .copyWith(color: Colors.black87),
              ),
              Text(
                value,
                style: Theme.of(context)
                    .typography
                    .englishLike
                    .bodyText2
                    .copyWith(color: Colors.black87),
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
