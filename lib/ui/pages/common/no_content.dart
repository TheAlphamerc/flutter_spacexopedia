import 'package:flutter/material.dart';

class NoContent extends StatelessWidget {
  const NoContent({
    Key key,
    this.message,
    this.messageStyle,
    this.onReload,
    this.dsiplayReloadButton = false,
  }) : super(key: key);
  final String message;
  final TextStyle messageStyle;
  final Function onReload;
  final bool dsiplayReloadButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            message ?? 'No content found!!',
            style: messageStyle ?? Theme.of(context).typography.dense.headline6,
            textAlign: TextAlign.center,
          ),
          if (!dsiplayReloadButton)
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: RaisedButton(child: Text('reload'), onPressed: onReload),
            ),
        ],
      ),
    );
  }
}
