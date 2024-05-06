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
}
