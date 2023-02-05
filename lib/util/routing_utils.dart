import 'package:flutter/material.dart';

extension PushWait on BuildContext {
  /// Push using Navigator, because go_router doesn't support waiting.
  Future<T?> pushWait<T extends Object?>(Widget page) async {
    return await Navigator.of(this).push(MaterialPageRoute(
      builder: (context) => page,
    ));
  }
}
