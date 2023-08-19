import 'package:shared_preferences/shared_preferences.dart';

class VideoPlayConfigRepository {
  final SharedPreferences _preferences;
  VideoPlayConfigRepository(this._preferences);

  static const String _autoplay = 'autoplay';
  static const String _muted = 'muted';

  Future<void> setMuted(bool value) async {
    _preferences.setBool(_muted, value);
  }

  Future<void> setAutoplay(bool value) async {
    _preferences.setBool(_autoplay, value);
  }

  bool isMuted() {
    return _preferences.getBool(_muted) ?? false;
  }

  bool isAutoplay() {
    return _preferences.getBool(_autoplay) ?? false;
  }
}
