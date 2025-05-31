import 'package:logger/logger.dart';

class Log {
  static final Logger _logger = Logger();

  static bool get _isDebug {
    var inDebug = false;
    assert(() {
      inDebug = true;
      return true;
    }());
    return inDebug;
  }

  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (_isDebug) {
      _logger.d(message, error: error, stackTrace: stackTrace);
    }
  }

  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (_isDebug) {
      _logger.e(message, error: error, stackTrace: stackTrace);
    }
  }

  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (_isDebug) {
      _logger.i(message, error: error, stackTrace: stackTrace);
    }
  }

  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (_isDebug) {
      _logger.w(message, error: error, stackTrace: stackTrace);
    }
  }
}
