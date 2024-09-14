import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:io' show Platform; // Import Platform class from dart:io
import 'package:flutter/foundation.dart' show kIsWeb; // Import kIsWeb

part 'device_info_state.dart';

class DeviceInfoCubit extends Cubit<DeviceInfoState> {
  DeviceInfoCubit() : super(DeviceInfoInitial());

  Future<void> fetchDeviceInfo() async {
    const Map<String, dynamic> defaultDeviceInfo = {
      'platform': 'Unknown',
      'url': 'https://localhost:5000/',
    };

    const Map<String, dynamic> webDeviceInfo = {
      'platform': 'Web',
      'url': 'https://localhost:5000/',
    };

    const Map<String, dynamic> androidDeviceInfo = {
      'platform': 'Android',
      'url': 'https://10.0.2.2:5000/',
    };

    const Map<String, dynamic> iosDeviceInfo = {
      'platform': 'iOS',
      'url': 'https://localhost:5000/',
    };

    if (kIsWeb) {
      emit(DeviceInfoLoaded(deviceInfo: webDeviceInfo));
      return;
    } else if (Platform.isAndroid) {
      emit(DeviceInfoLoaded(deviceInfo: androidDeviceInfo));
      return;
    } else if (Platform.isIOS) {
      emit(DeviceInfoLoaded(deviceInfo: iosDeviceInfo));
      return;
    } else {
      emit(DeviceInfoLoaded(deviceInfo: defaultDeviceInfo));
      return;
    }
  }
}
