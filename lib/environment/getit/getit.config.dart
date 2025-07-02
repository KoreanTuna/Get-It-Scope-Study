// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:get_it_scope_study/common/data/repository/user_repository.dart'
    as _i10;
import 'package:get_it_scope_study/presentation/detail/view_model/detail_view_model.dart'
    as _i658;
import 'package:get_it_scope_study/presentation/home/view_model/home_view_model.dart'
    as _i821;
import 'package:get_it_scope_study/presentation/splash/view_model/splash_view_model.dart'
    as _i222;
import 'package:get_it_scope_study/router/router.dart' as _i12;
import 'package:get_it_scope_study/router/router_observer.dart' as _i451;
import 'package:go_router/go_router.dart' as _i583;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final goRouterModule = _$GoRouterModule();
    gh.factory<_i222.SplashViewModel>(() => _i222.SplashViewModel());
    gh.factory<_i658.DetailViewModel>(() => _i658.DetailViewModel());
    gh.factory<_i451.RouterObserver>(() => _i451.RouterObserver());
    gh.singleton<_i583.GoRouter>(() => goRouterModule.router);
    gh.lazySingleton<_i10.UserRepository>(() => _i10.UserRepository());
    gh.factory<_i821.HomeViewModel>(
      () => _i821.HomeViewModel(gh<_i10.UserRepository>()),
    );
    return this;
  }
}

class _$GoRouterModule extends _i12.GoRouterModule {}
