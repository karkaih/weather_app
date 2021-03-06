import 'package:intl/intl.dart';
class Coord {
  double lon;

  double lat;

  String Name;

  String Icon;

  dynamic temp;
  dynamic Max;
  dynamic Min;
  dynamic Evening;
  dynamic Night;

  String Description;

  String country;

  String dt;

  Coord.fristPage(
      [this.Name, this.country, this.Icon, this.temp, this.Description]);

  Coord.secondPage(
      [this.dt,this.Icon, this.temp, this.Description,this.Max,this.Min,this.Evening,this.Night]);

  Coord([this.lon, this.lat]);

  factory Coord.fromjson(Map<String, dynamic> map) {
    return Coord.fristPage(
        map["name"], map["sys"]["country"], map["weather"][0]["icon"],
        map["main"]["temp"], map["weather"][0]["description"]);
  }

  factory Coord.fromjson1(Map<String, dynamic> map) {
    return Coord(map["coord"]["lon"], map["coord"]["lat"]);
  }

  List<Coord> getList(Map<String, dynamic> map) {
    List<Coord> list = [];
    for (var u in map['daily']) {

      int timeInMillis = u['dt'];
      var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis*1000);
      var formattedDate = DateFormat.yMMMd().format(date);

      list.add(Coord.secondPage(formattedDate,u["weather"][0]["icon"],
      u["temp"]["day"],u["weather"][0]["description"],u["temp"]["max"],u["temp"]["min"],u["temp"]["eve"],u["temp"]["night"]));
    }

    return list;
  }
}
