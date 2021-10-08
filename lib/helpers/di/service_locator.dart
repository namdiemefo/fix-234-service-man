import 'package:get_it/get_it.dart';
import 'package:service_man/api/repository/auth/auth_repository.dart';
import 'package:service_man/api/repository/bills/bills_repository.dart';
import 'package:service_man/api/repository/bookings/booking_repository.dart';
import 'package:service_man/db/app_storage.dart';

GetIt locator = GetIt();
void setUpLocator() {
  locator.registerLazySingleton(() => AppStorage());
  locator.registerLazySingleton(() => AuthRepository());
  locator.registerLazySingleton(() => BookingRepository());
  locator.registerLazySingleton(() => BillsRepository());
}