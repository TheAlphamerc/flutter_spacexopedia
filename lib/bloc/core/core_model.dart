import 'dart:convert';

class CoreModel {
    CoreModel({
        this.coreSerial,
        this.block,
        this.status,
        this.originalLaunch,
        this.originalLaunchUnix,
        this.missions,
        this.reuseCount,
        this.rtlsAttempts,
        this.rtlsLandings,
        this.asdsAttempts,
        this.asdsLandings,
        this.waterLanding,
        this.details,
    });

    String coreSerial;
    int block;
    Status status;
    DateTime originalLaunch;
    int originalLaunchUnix;
    List<Mission> missions;
    int reuseCount;
    int rtlsAttempts;
    int rtlsLandings;
    int asdsAttempts;
    int asdsLandings;
    bool waterLanding;
    String details;

    factory CoreModel.fromRawJson(String str) => CoreModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CoreModel.fromJson(Map<String, dynamic> json) => CoreModel(
        coreSerial: json["core_serial"] == null ? null : json["core_serial"],
        block: json["block"] == null ? null : json["block"],
        status: json["status"] == null ? null : statusValues.map[json["status"]],
        originalLaunch: json["original_launch"] == null ? null : DateTime.parse(json["original_launch"]),
        originalLaunchUnix: json["original_launch_unix"] == null ? null : json["original_launch_unix"],
        missions: json["missions"] == null ? null : List<Mission>.from(json["missions"].map((x) => Mission.fromJson(x))),
        reuseCount: json["reuse_count"] == null ? null : json["reuse_count"],
        rtlsAttempts: json["rtls_attempts"] == null ? null : json["rtls_attempts"],
        rtlsLandings: json["rtls_landings"] == null ? null : json["rtls_landings"],
        asdsAttempts: json["asds_attempts"] == null ? null : json["asds_attempts"],
        asdsLandings: json["asds_landings"] == null ? null : json["asds_landings"],
        waterLanding: json["water_landing"] == null ? null : json["water_landing"],
        details: json["details"] == null ? null : json["details"],
    );

    Map<String, dynamic> toJson() => {
        "core_serial": coreSerial == null ? null : coreSerial,
        "block": block == null ? null : block,
        "status": status == null ? null : statusValues.reverse[status],
        "original_launch": originalLaunch == null ? null : originalLaunch.toIso8601String(),
        "original_launch_unix": originalLaunchUnix == null ? null : originalLaunchUnix,
        "missions": missions == null ? null : List<dynamic>.from(missions.map((x) => x.toJson())),
        "reuse_count": reuseCount == null ? null : reuseCount,
        "rtls_attempts": rtlsAttempts == null ? null : rtlsAttempts,
        "rtls_landings": rtlsLandings == null ? null : rtlsLandings,
        "asds_attempts": asdsAttempts == null ? null : asdsAttempts,
        "asds_landings": asdsLandings == null ? null : asdsLandings,
        "water_landing": waterLanding == null ? null : waterLanding,
        "details": details == null ? null : details,
    };

  String getStatus(){
    switch (status) {
      case Status.ACTIVE: return "Active";
      case Status.INACTIVE: return "InActive";
      case Status.LOST: return "Lost";
      case Status.UNKNOWN: return "Unknown";
      default:return "Unknown";
    }
  }
}

class Mission {
    Mission({
        this.name,
        this.flight,
    });

    String name;
    int flight;

    factory Mission.fromRawJson(String str) => Mission.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Mission.fromJson(Map<String, dynamic> json) => Mission(
        name: json["name"] == null ? null : json["name"],
        flight: json["flight"] == null ? null : json["flight"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "flight": flight == null ? null : flight,
    };
}

enum Status { LOST, INACTIVE, UNKNOWN, ACTIVE }

final statusValues = EnumValues({
    "active": Status.ACTIVE,
    "inactive": Status.INACTIVE,
    "lost": Status.LOST,
    "unknown": Status.UNKNOWN
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
