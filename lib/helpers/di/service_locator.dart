import 'package:get_it/get_it.dart';
import 'package:service_man/db/app_storage.dart';

GetIt locator = GetIt();
void setUpLocator() {
  locator.registerLazySingleton(() => AppStorage());
}