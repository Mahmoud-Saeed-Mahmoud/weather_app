import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

import '../datasources/local/get_storage_provider.dart';

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier(super._state, this._getStorage);

  final GetStorage _getStorage;

  void toggleThemeMode() {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  }

  void writeThemeMode() {
    _getStorage.write('isDark', state == ThemeMode.dark);
    _getStorage.save();
  }
}

final themeModeProvider =
    StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  final getStorage = ref.read(getStorageProvider);
  return getStorage.hasData('isDark')
      ? ThemeModeNotifier(
          getStorage.read('isDark') ? ThemeMode.dark : ThemeMode.light,
          getStorage)
      : ThemeModeNotifier(ThemeMode.system, getStorage);
});
