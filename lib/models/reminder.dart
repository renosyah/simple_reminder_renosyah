class Reminder {
  String name;
  DateTime time;

  Reminder({this.name, this.time, });

  Reminder.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    time = DateTime.parse(json['time']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['time'] = this.time.toString();
    return data;
  }


}