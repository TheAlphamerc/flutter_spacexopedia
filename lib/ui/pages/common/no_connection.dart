import 'package:flutter/material.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({
    Key key,
    this.message,
    this.messageStyle,
    this.onReload,
    this.hideReloadButton = false,
  }) : super(key: key);
  final String message;
  final TextStyle messageStyle;
  final Function onReload;
  final bool hideReloadButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            message ?? 'No internet connection!!',
            style: messageStyle ??
                Theme.of(context)
                    .typography
                    .dense
                    .headline5
                    .copyWith(color: Theme.of(context).errorColor),
            textAlign: TextAlign.center,
          ),
          if(!hideReloadButton)
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: RaisedButton(child: Text('reload'), onPressed: onReload),
          ),
        ],
      ),
    );
  }
}
