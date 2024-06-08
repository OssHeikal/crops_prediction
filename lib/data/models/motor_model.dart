class MotorModel {
  final bool isForward;
  final bool isBackward;
  final bool isLeft;
  final bool isRight;
  final bool waterPump;

  MotorModel({
    required this.isForward,
    required this.isBackward,
    required this.isLeft,
    required this.isRight,
    this.waterPump = false,
  });

  MotorModel copyWith({
    bool? isForward,
    bool? isBackward,
    bool? isLeft,
    bool? isRight,
    bool? waterPump,
  }) {
    return MotorModel(
      isForward: isForward ?? this.isForward,
      isBackward: isBackward ?? this.isBackward,
      isLeft: isLeft ?? this.isLeft,
      isRight: isRight ?? this.isRight,
      waterPump: waterPump ?? this.waterPump,
    );
  }

  toMap() {
    return {
      'forward': isForward,
      'backward': isBackward,
      'left': isLeft,
      'right': isRight,
      'water_pump': waterPump,
    };
  }

  factory MotorModel.fromMap(map) {
    return MotorModel(
      isForward: map['forward'],
      isBackward: map['backward'],
      isLeft: map['left'],
      isRight: map['right'],
      waterPump: map['water_pump'],
    );
  }
}
