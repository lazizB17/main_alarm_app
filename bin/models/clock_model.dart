
enum Status {
  waiting, target, running, expired
}

class Clock implements Comparable<Clock>{
  late DateTime time;
  bool isActive = true;
  Status status = Status.waiting;

  Clock(int hour, int minute) {
    if(DateTime.now().hour < hour) {
      time = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        hour,
        minute,
      );
    } else if(DateTime.now().hour == hour && DateTime.now().minute < minute) {
      time = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        hour,
        minute,
      );
    } else {
      time = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day + 1,
        hour,
        minute,
      );
    }
  }

  @override
  bool operator == (Object other) {
    return other is Clock && other.time == time;
  }

  @override
  int get hashCode => time.hashCode;

  @override
  int compareTo(Clock other) {
    return time.compareTo(other.time);
  }
}