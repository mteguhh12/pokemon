import 'package:logger/logger.dart';

var logger = Logger(
    // filter: MyFilter()
    );

class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
