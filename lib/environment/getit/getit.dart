import 'package:get_it/get_it.dart';
import 'package:get_it_scope_study/environment/getit/getit.config.dart';
import 'package:injectable/injectable.dart';

GetIt locator = GetIt.instance;

@injectableInit
Future<void> setUpGetItConfig() async {
  await locator.init();
}
