import 'dart:async';
import 'dart:io';
import '../models/clock_model.dart';
import 'language_service.dart';

class ClockService {
  List<Clock> list = [];

  //create alarm clock
  void add({required int hour, required int minute}) {
    Clock clock = Clock(hour, minute);
    list.add(clock);
    onClock(clock);
  }

  void onClock(Clock clock) {
    stdout.writeln(LangService.tr("successCreate"));
    //waiting
    Timer(clock.time.difference(DateTime.now()), () {
      clock.status = Status.target;
      clock = ringing(clock);
    });
    clock.status = Status.expired;
    clock.isActive = false;
    list[list.indexOf(clock)] = clock;
  }

  Clock ringing(Clock clock) {
    clock.status = Status.running;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(timer.tick <= 15) {
        stdout.writeln(LangService.tr("running"));
      } else {
        timer.cancel();
        stdout.writeln(LangService.tr("finished"));
      }
    });
    return clock;
  }
}