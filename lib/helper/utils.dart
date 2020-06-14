import 'package:intl/intl.dart';

class Utils{
  static String toformattedDate(DateTime date){
    return DateFormat('dd MMM yyyy hh:mm:a').format(date);
  }
}