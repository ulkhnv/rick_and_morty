import 'package:get_it/get_it.dart';
import 'package:domain/di.dart';
import 'package:data/di.dart';
import 'package:presentation/di.dart';

final GetIt sl = GetIt.instance;

Future<void> setupDI() async {
  await setupPresentation(sl);
  await setupDomain(sl);
  await setupData(sl);
}
