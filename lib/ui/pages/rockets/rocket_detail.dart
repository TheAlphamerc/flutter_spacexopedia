import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/bloc/rocket/rocket_model.dart';
import 'package:flutter_spacexopedia/ui/theme/theme.dart';
import 'package:flutter_spacexopedia/ui/theme/extentions.dart';
import 'package:flutter_spacexopedia/ui/widgets/image_slider.dart';
import 'package:flutter_spacexopedia/ui/widgets/title_text.dart';

class RocketDetail extends StatelessWidget {
  const RocketDetail({Key key, this.model}) : super(key: key);
  final RocketModel model;
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
                    child: Text(model.rocketName),
                    title: "Title of screen",
                  ),
                  floating: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      PhotoPageView(
                        imageList: model.flickrImages,
                      ),
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
                      SizedBox(height:10),
                      Divider(height: 0),
                      _heading(context,"Basic info",theme),
                      _ListTile("Name", model.rocketName),
                      Divider(height: 0),
                      _ListTile("Layout", model.engines.layout),
                      Divider(height: 0),
                      _ListTile("Diameter", "${model.diameter.meters} m"),
                      Divider(height: 0),
                      _ListTile("Height", "${model.height.meters} m"),
                      Divider(height: 0),
                      _ListTile("Weight", "${model.mass.kg} Kg"),
                      Divider(height: 0),
                      _ListTile("Engines", "${model.engines.number}"),
                      Divider(height: 0),
                      _ListTile("Landing legs", "${model.landingLegs.number}"),
                      Divider(height: 0),
                      _ListTile("Landing legs material", "${model.landingLegs.material}"),
                      Divider(height: 0),
                      _ListTile("Boosters", model.boosters.toString()),
                      Divider(height: 0),
                      _ListTile("Sucess rate", "${model.successRatePct} %"),
                      Divider(height: 0),
                      _ListTile("Cost per launch", model.costPerLaunch.toString()),
                      _heading(context,"Engine",theme),
                      Divider(height: 0),
                      _ListTile("Type ", "${model.engines.type}"),
                      Divider(height: 0),
                      _ListTile("Version", "${model.engines.version}"),
                      Divider(height: 0),
                      _ListTile("Layout", "${model.engines.layout}"),
                      Divider(height: 0),
                      _ListTile("Propellant 1", "${model.engines.propellant1}"),
                      Divider(height: 0),
                      _ListTile("Propellant 1", "${model.engines.propellant2}"),
                      Divider(height: 0),
                      _ListTile("thrust sea level", "${model.engines.thrustSeaLevel.kN} Kn"),
                      Divider(height: 0),
                      _ListTile("Thrust to weight", "${model.engines.thrustToWeight}"),
                       Divider(height: 0),
                      _ListTile("Thrust to vaccum", "${model.engines.thrustVacuum.kN} Kn"),
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