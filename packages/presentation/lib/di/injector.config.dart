// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../animation/circular_animation.dart' as _i6;
import '../animation/scale_animation.dart' as _i8;
import '../app/bloc/app_bloc.dart' as _i3;
import '../navigator/app_navigator.dart' as _i4;
import '../navigator/app_navigator_impl.dart' as _i5;
import '../screens/circular_animator/bloc/circular_bloc.dart' as _i9;
import '../screens/main/bloc/main_bloc.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AppBloc>(() => _i3.AppBloc());
  gh.singleton<_i4.AppNavigator>(_i5.AppNavigatorImpl());
  gh.factory<_i6.CircularAnimation>(() => _i6.CircularAnimation());
  gh.factory<_i7.MainBloc>(() => _i7.MainBloc());
  gh.factory<_i8.ScaleAnimation>(() => _i8.ScaleAnimation());
  gh.factory<_i9.CircularBloc>(() => _i9.CircularBloc(
      get<_i6.CircularAnimation>(), get<_i8.ScaleAnimation>()));
  return get;
}
