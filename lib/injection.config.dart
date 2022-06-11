// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/dashboard_notifier.dart' as _i3;
import 'application/login_menu_notifier.dart' as _i4;
import 'application/supplementary_sidemenu_notifier.dart' as _i5;
import 'application/user_provider_notifier.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.DashboardNotifier>(() => _i3.DashboardNotifier());
  gh.factory<_i4.LoginMenuNotifier>(() => _i4.LoginMenuNotifier());
  gh.factory<_i5.SupplementarySidemenuNotifier>(
      () => _i5.SupplementarySidemenuNotifier());
  gh.factory<_i6.UserProfileNotifier>(() => _i6.UserProfileNotifier());
  return get;
}
