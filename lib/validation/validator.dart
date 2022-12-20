import 'package:flutter/cupertino.dart';

class Validator {
  final GlobalKey<FormState> globalKey;
  Validator({
    required this.globalKey,
  });

  bool validate() {
    return globalKey.currentState!.validate();
  }
}
