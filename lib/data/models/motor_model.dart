class MotorModel {
  final bool isForward;
  final bool isBackward;
  final bool isLeft;
  final bool isRight;

  MotorModel({
    required this.isForward,
    required this.isBackward,
    required this.isLeft,
    required this.isRight,
  });

  MotorModel copyWith({
    bool? isForward,
    bool? isBackward,
    bool? isLeft,
    bool? isRight,
  }) {
    return MotorModel(
      isForward: isForward ?? this.isForward,
      isBackward: isBackward ?? this.isBackward,
      isLeft: isLeft ?? this.isLeft,
      isRight: isRight ?? this.isRight,
    );
  }

  toMap() {
    return {
      'forward': isForward,
      'backward': isBackward,
      'left': isLeft,
      'right': isRight,
    };
  }

  factory MotorModel.fromMap(map) {
    return MotorModel(
      isForward: map['forward'],
      isBackward: map['backward'],
      isLeft: map['left'],
      isRight: map['right'],
    );
  }
}
