import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/ui/widgets/title_text.dart';

class TitleValue extends StatelessWidget {
  const TitleValue({Key key, this.title, this.value})
      : super(key: key);
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        TitleText(title, fontSize: 14,fontWeight: FontWeight.w500,),
        SizedBox(
          width: 5,
        ),
        TitleText(value, fontSize: 14,fontWeight: FontWeight.w400,),
      ],
    );
  }
}
