import 'package:domain/models/enums.dart';

class TransitionData<T> {
  AnimationTranisitionState next;
  T? data;
  String? caller;

  TransitionData({
    required this.next,
    this.data,
    this.caller,
  });
}
