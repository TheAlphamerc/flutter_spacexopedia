import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/ui/widgets/customWidgets.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    Key key,
    this.bodyContent,
    this.imagePath,
    this.hideImage = false,
    this.imagePadding = const EdgeInsets.all(0),
  }) : super(key: key);
  final Widget bodyContent;
  final String imagePath;
  final bool hideImage;
  final EdgeInsetsGeometry imagePadding;

  Widget _image(context) {
    if (imagePath == null) {
      return _noImage(context);
    }

    return Padding( 
      padding: imagePadding,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          topLeft: Radius.circular(8),
        ),
        child: customNetworkImage(imagePath,
            fit: BoxFit.cover, placeholder: _noImage(context)),
      ),
    );
  }

  Widget _noImage(context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(8),
        topLeft: Radius.circular(8),
      ),
      child: Container(
        color: theme.disabledColor, //Color(0xffeeeeee),
        child: Center(
          child: Text(
            "No Photo".toUpperCase(),
            style: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: theme.cardColor.withOpacity(.4),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      height: 128,
      child: Row(
        children: <Widget>[
          if (!hideImage)
            AspectRatio(
              aspectRatio: 1,
              child: _image(context),
            ),
          if (!hideImage)
            SizedBox(
              width: 16,
            ),
          Expanded(flex: 3, child: bodyContent)
        ],
      ),
    );
  }
}
