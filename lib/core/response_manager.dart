import 'dart:io';

import 'package:flutter/foundation.dart';

String getOs() {
  if (kIsWeb) {
    return 'web';
  }
  return Platform.operatingSystem;
}
