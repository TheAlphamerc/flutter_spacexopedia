import 'package:flutter/material.dart';

class SListTile extends StatelessWidget {
  const SListTile(this.title, this.value, {Key key, this.onPressed})
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