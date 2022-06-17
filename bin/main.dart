import 'dart:io';
import 'service/clock_service.dart';
import 'service/language_service.dart';
import 'dart:async';

void showOption(){
  print("1.Budilnik");
  print("2.Xalqaro soatlar");
  print("3.Timer");
  print("Qaysi biridan foydalanmoqchisiz?");
}
void showMenu(){
  print("*****************************");
  print("1.Tokio");
  print("2.Moskva");
  print("3.Pekin");
  print("4.Dushanbe");
  print("5.Lissabon");
  print("6.Madrid");
  print("7.Kiev");
  print("8.Toshkent");
  print("Bittasini tanlang");
  print("*****************************");
}
void optional(int option){
  switch(option){
    case 1: print("Tokio vaqti: ${DateTime.now().add(Duration(hours: 4))}") ;break;
    case 2: print("Moskva vaqti: ${DateTime.now().add(Duration(hours: -2))}");break;
    case 3:print("Pekin vaqti: ${DateTime.now().add(Duration(hours: 3))}");break;
    case 4:print("Dushanbe vaqti: ${DateTime.now().add(Duration(hours: 0))}");break;
    case 5:print("Lissabon vaqti: ${DateTime.now().add(Duration(hours: -5))}");break;
    case 6:print("Madrid vaqti: ${DateTime.now().add(Duration(hours: 5))}");break;
    case 7:print("Kiev vaqti: ${DateTime.now().add(Duration(hours: -3, minutes: -1))}");break;
    case 8:print("Toshkent vaqti: ${DateTime.now().add(Duration(hours: 0))}");break;
    default:print("Xato buyuq kiritildi!");
  }
}

void main() {
  showOption();

  int option3 = int.parse(stdin.readLineSync()!);
  switch(option3){
    case 1: return qongiroq();
    case 2: {
      showMenu();
      int out = int.parse(stdin.readLineSync()!);
      return optional(out);
    }
    case 3: {
      print("Timer uchun qiymat kiriting!");
      int time = int.parse(stdin.readLineSync()!);
      return timer(time);
    }
    default: return print("Error!");
  }
  // showMenu();
}

void qongiroq(){
  LangService.language = Language.ru;
  int? hour;
  int? minute;

  ClockService clockService = ClockService();
  stdout.writeln(LangService.tr("appName"));
  stdout.writeln(LangService.tr("createClock"));

  stdout.writeln(LangService.tr("hour"));
  hour = int.tryParse(stdin.readLineSync()!);

  stdout.writeln(LangService.tr("minute"));
  minute = int.tryParse(stdin.readLineSync()!);

  clockService.add(hour: hour!, minute: minute!);
}

void timer(int time){
  Timer.periodic(Duration(seconds: 1), (timer) {
    print(timer.tick);
    time--;
    if (time == 0) {
      print("Timer yakunlandi");
      timer.cancel();
    }
  });
}