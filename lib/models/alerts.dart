// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'alert.dart';

class Alerts {
  List<Alert>? alert;

  Alerts({this.alert});

  Alerts.fromJson(Map<String, dynamic> json) {
    if (json['alert'] != null) {
      alert = <Alert>[];
      json['alert'].forEach((v) {
        alert!.add(Alert.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (alert != null) {
      data['alert'] = alert!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() => 'Alerts(alert: $alert)';
}
