import 'package:intl/intl.dart';

class Utils{
  static String toformattedDate(DateTime date){
    return DateFormat('dd MMM yyyy').format(date);
  }
  static String toformattedDate2(DateTime date){
    return DateFormat('dd-MMM-yyyy hh:mm a').format(date);
  }
}