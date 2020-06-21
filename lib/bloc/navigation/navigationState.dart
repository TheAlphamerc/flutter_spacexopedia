import 'package:equatable/equatable.dart';
import 'package:flutter_spacexopedia/ui/theme/theme.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NavigationState extends Equatable {}

class SelectPageIndex extends NavigationState {
  final int index;

  SelectPageIndex(this.index);
  @override
  List<Object> get props => ["Selected page: $index"];
}
class SelectTheme extends SelectPageIndex {
  final ThemeType type;
  final int index;
  SelectTheme(this.index,this.type) : super(index);
  @override
  List<Object> get props => ["Select $type theme"];
}
