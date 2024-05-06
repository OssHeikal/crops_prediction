import 'package:crops_prediction/data/models/motor_model.dart';

enum Movement {
  stop,
  forward,
  backward,
  left,
  right;

  double get angle {
    switch (this) {
      case Movement.stop:
        return 0;
      case Movement.forward:
        return 270;
      case Movement.backward:
        return 90;
      case Movement.left:
        return 180;
      case Movement.right:
        return 0;
    }
  }

  MotorModel get motorModel {
    switch (this) {
      case Movement.stop:
        return MotorModel(isForward: false, isBackward: false, isLeft: false, isRight: false);
      case Movement.forward:
        return MotorModel(isForward: true, isBackward: false, isLeft: false, isRight: false);
      case Movement.backward:
        return MotorModel(isForward: false, isBackward: true, isLeft: false, isRight: false);
      case Movement.left:
        return MotorModel(isForward: false, isBackward: false, isLeft: true, isRight: false);
      case Movement.right:
        return MotorModel(isForward: false, isBackward: false, isLeft: false, isRight: true);
    }
  }
}
