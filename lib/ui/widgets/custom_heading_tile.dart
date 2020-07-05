import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/ui/theme/theme.dart';
import 'package:flutter_spacexopedia/ui/widgets/title_text.dart';

class SHeadingTile extends StatelessWidget {
  const SHeadingTile(this.title,{Key key}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.only(bottom: 8, left: 16),
      height: 50,
      width: AppTheme.fullWidth(context),
      color: Theme.of(context).colorScheme.primary.withAlpha(30),
      child: TitleText(title, fontSize: 16),
    );
  }
}
