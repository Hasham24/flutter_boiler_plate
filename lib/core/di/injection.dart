import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:boiler_plate/core/di/injection.config.dart';

final sl = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => sl.init();
