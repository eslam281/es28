class TimingModel {
  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? maghrib;
  String? isha;
  String? lastthird;

  TimingModel(
      {required this.fajr,
        required this.sunrise,
        required this.dhuhr,
        required this.asr,
        required this.maghrib,
        required this.isha,
        required this.lastthird});

  TimingModel.fromJson(Map<dynamic, dynamic> json) {
    fajr = json['Fajr'];
    sunrise = json['Sunrise'];
    dhuhr = json['Dhuhr'];
    asr = json['Asr'];
    maghrib = json['Maghrib'];
    isha = json['Isha'];
    lastthird = json['Lastthird'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Fajr'] = this.fajr;
    data['Sunrise'] = this.sunrise;
    data['Dhuhr'] = this.dhuhr;
    data['Asr'] = this.asr;
    data['Maghrib'] = this.maghrib;
    data['Isha'] = this.isha;
    data['Lastthird'] = this.lastthird;
    return data;
  }
}
