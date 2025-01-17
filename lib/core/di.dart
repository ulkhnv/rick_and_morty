import 'package:get_it/get_it.dart';
import 'package:domain/di/app_injector.dart';
import 'package:data/di/app_injector.dart';
import 'package:presentation/di/app_injector.dart';

final GetIt sl = GetIt.instance;

Future<void> setupDI() async {
  await setupPresentation(sl);
  await setupDomain(sl);
  await setupData(sl);
}
