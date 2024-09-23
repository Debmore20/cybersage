part of 'device_info_cubit.dart';

@immutable
sealed class DeviceInfoState {}

final class DeviceInfoInitial extends DeviceInfoState {
  DeviceInfoInitial();
  final Map<String, dynamic> deviceInfo = {
    'platform': 'Unknown',
    'url': 'https://localhost:5000/',
  };
}

final class DeviceInfoLoaded extends DeviceInfoState {
  final Map<String, dynamic> deviceInfo;
  DeviceInfoLoaded({required this.deviceInfo});
}
