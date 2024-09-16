import 'dart:io';

import 'package:flutter/foundation.dart';

Map<String, dynamic> getDeviceInfo() {
  Map<String, dynamic> defaultDeviceInfo = {
    'platform': 'Unknown',
    'url': 'http://localhost:5000',
  };

  final Map<String, dynamic> deviceInfo;

  if (kIsWeb) {
    deviceInfo = {
      'platform': 'Web',
      'url': 'http://localhost:5000',
    };
    return deviceInfo;
  } else if (Platform.isAndroid) {
    deviceInfo = {
      'platform': 'Android',
      'url': 'http://10.0.2.2:5000',
    };
    return deviceInfo;
  } else if (Platform.isIOS) {
    deviceInfo = {
      'platform': 'iOS',
      'url': 'http://localhost:5000',
    };
    return deviceInfo;
  }
  return defaultDeviceInfo;
}
