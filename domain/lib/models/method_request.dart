import 'dart:ffi';

class MethodRequest {
  String value;
  String token;
  Uint64 choice;
  String factor;

  MethodRequest({
    required this.choice,
    required this.factor,
    required this.token,
    required this.value,
  });
}
