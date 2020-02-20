import 'dart:async';

import 'package:flutter/material.dart';

class TimerService extends ChangeNotifier {
  Stopwatch _watchL;
  Timer _timerL;

  Stopwatch _watchR;
  Timer _timerR;

  Duration get currentDurationL => _currentDurationL;
  Duration _currentDurationL = Duration.zero;

  bool get isRunningL => _timerL != null;

  Duration get currentDurationR => _currentDurationR;
  Duration _currentDurationR = Duration.zero;

  bool get isRunningR => _timerR != null;

  TimerService() {
    _watchL = Stopwatch();
    _watchR = Stopwatch();

  }

  void _onTickL(Timer timer) {
    _currentDurationL = _watchL.elapsed;

    // notify all listening widgets
    notifyListeners();
  }
  void _onTickR(Timer timer) {
    _currentDurationR = _watchR.elapsed;

    // notify all listening widgets
    notifyListeners();
  }

  void startL() {
    if (_timerL != null) return;

    _timerL = Timer.periodic(Duration(seconds: 1), _onTickL);
    _watchL.start();

    notifyListeners();
  }

  void startR() {
    if (_timerR != null) return;

    _timerR = Timer.periodic(Duration(seconds: 1), _onTickR);
    _watchR.start();

    notifyListeners();
  }

  void stopL() {
    _timerL?.cancel();
    _timerL = null;
    _watchL.stop();
    _currentDurationL = _watchL.elapsed;

    notifyListeners();
  }

  void stopR() {
    _timerR?.cancel();
    _timerR = null;
    _watchR.stop();
    _currentDurationR = _watchR.elapsed;

    notifyListeners();
  }

  void resetL() {
    stopL();
    _watchL.reset();
    _currentDurationL = Duration.zero;

    notifyListeners();
  }
  void resetR() {
    stopR();
    _watchR.reset();
    _currentDurationR = Duration.zero;
    notifyListeners();
  }

  static TimerService of(BuildContext context) {
    var provider = context.inheritFromWidgetOfExactType(TimerServiceProvider) as TimerServiceProvider;
    return provider.service;
  }
}
class TimerServiceProvider extends InheritedWidget {
  const TimerServiceProvider({Key key, this.service, Widget child}) : super(key: key, child: child);

  final TimerService service;

  @override
  bool updateShouldNotify(TimerServiceProvider old) => service != old.service;
}