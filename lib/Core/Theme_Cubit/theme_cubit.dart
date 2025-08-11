import 'package:ecommerce_admin/Core/Helper/app_helper.dart';
import 'package:ecommerce_admin/Core/Helper/cache_helper.dart';
import 'package:ecommerce_admin/Core/Theme_Cubit/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(InitialThemeState()) {
    getTheme();
  }
  bool isDark = false;
  Future<void> chanageTheme(bool? isValue) async{
    if (isValue != null) {
      isDark = isValue;
      emit(DarkThemeState());
    } else {
      await CacheHelper().saveData(key: AppHelper.kDark, value: isDark);
      isDark = !isDark;
      emit(DarkThemeState());
    }
  }
  Future<bool> getTheme() async {
    isDark =
        await CacheHelper().getData(key: AppHelper.kDark) ?? false;
    emit(LightThemeState());
    return isDark;
  }
}