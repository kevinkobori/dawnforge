import 'package:dawnforge/app/app.dart';
import 'package:dawnforge/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
