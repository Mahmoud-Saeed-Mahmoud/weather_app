// ignore_for_file: public_member_api_docs, sort_constructors_first
class Alert {
  String? headline;
  String? msgtype;
  String? severity;
  String? urgency;
  String? areas;
  String? category;
  String? certainty;
  String? event;
  String? note;
  String? effective;
  String? expires;
  String? desc;
  String? instruction;

  Alert(
      {this.headline,
      this.msgtype,
      this.severity,
      this.urgency,
      this.areas,
      this.category,
      this.certainty,
      this.event,
      this.note,
      this.effective,
      this.expires,
      this.desc,
      this.instruction});

  Alert.fromJson(Map<String, dynamic> json) {
    headline = json['headline'];
    msgtype = json['msgtype'];
    severity = json['severity'];
    urgency = json['urgency'];
    areas = json['areas'];
    category = json['category'];
    certainty = json['certainty'];
    event = json['event'];
    note = json['note'];
    effective = json['effective'];
    expires = json['expires'];
    desc = json['desc'];
    instruction = json['instruction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['headline'] = headline;
    data['msgtype'] = msgtype;
    data['severity'] = severity;
    data['urgency'] = urgency;
    data['areas'] = areas;
    data['category'] = category;
    data['certainty'] = certainty;
    data['event'] = event;
    data['note'] = note;
    data['effective'] = effective;
    data['expires'] = expires;
    data['desc'] = desc;
    data['instruction'] = instruction;
    return data;
  }

  @override
  String toString() {
    return 'Alert(headline: $headline, msgtype: $msgtype, severity: $severity, urgency: $urgency, areas: $areas, category: $category, certainty: $certainty, event: $event, note: $note, effective: $effective, expires: $expires, desc: $desc, instruction: $instruction)';
  }
}
