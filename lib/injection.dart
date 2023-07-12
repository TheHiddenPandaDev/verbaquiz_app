import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:verbaquiz/injection.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
GetIt configureDependencies() {
  final getIt = $initGetIt(GetIt.instance);
  return getIt;
}