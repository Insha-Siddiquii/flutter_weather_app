import 'dart:async';

abstract class DiModule {
  FutureOr<void> setup();

  void dispose() {}
}
