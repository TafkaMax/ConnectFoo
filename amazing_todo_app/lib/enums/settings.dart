enum Settings { settings, logout, theme }

String getSettingString(Settings setting) {
  return setting.toString().split('.').last;
}
