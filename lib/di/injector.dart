import 'package:get_it/get_it.dart';
import 'package:domain/di/injector.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/di/injector.dart';

final getIt = GetIt.I;

@InjectableInit()
void configureDependencies() {
  configureDomainDependencies(getIt);
  configurePresentationDependencies(getIt);
}