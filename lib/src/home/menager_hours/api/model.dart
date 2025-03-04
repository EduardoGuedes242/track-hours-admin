class MenagerHoursModel {
  int? eplId;
  String? eplName;
  List<TmeEntryRecords>? tmeEntryRecords;

  MenagerHoursModel({this.eplId, this.eplName, this.tmeEntryRecords});

  MenagerHoursModel.fromJson(Map<String, dynamic> json) {
    eplId = json['eplId'];
    eplName = json['eplName'];
    if (json['tmeEntryRecords'] != null) {
      tmeEntryRecords = <TmeEntryRecords>[];
      json['tmeEntryRecords'].forEach((v) {
        tmeEntryRecords!.add(new TmeEntryRecords.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eplId'] = this.eplId;
    data['eplName'] = this.eplName;
    if (this.tmeEntryRecords != null) {
      data['tmeEntryRecords'] =
          this.tmeEntryRecords!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TmeEntryRecords {
  String? tmeDate;
  String? timeEntry1;
  String? timeEntry2;
  String? timeEntry3;
  String? timeEntry4;
  String? totalHours;

  TmeEntryRecords({
    this.tmeDate,
    this.timeEntry1,
    this.timeEntry2,
    this.timeEntry3,
    this.timeEntry4,
    this.totalHours,
  });

  TmeEntryRecords.fromJson(Map<String, dynamic> json) {
    tmeDate = json['tmeDate'];
    timeEntry1 = json['timeEntry1'];
    timeEntry2 = json['timeEntry2'];
    timeEntry3 = json['timeEntry3'];
    timeEntry4 = json['timeEntry4'];
    totalHours = json['totalHours'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tmeDate'] = this.tmeDate;
    data['timeEntry1'] = this.timeEntry1;
    data['timeEntry2'] = this.timeEntry2;
    data['timeEntry3'] = this.timeEntry3;
    data['timeEntry4'] = this.timeEntry4;
    data['totalHours'] = this.totalHours;
    return data;
  }
}
