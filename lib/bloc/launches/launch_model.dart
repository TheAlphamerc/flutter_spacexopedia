import 'dart:convert';

class Launch {
    Launch({
        this.flightNumber,
        this.missionName,
        this.missionId,
        this.upcoming,
        this.launchYear,
        this.launchDateUnix,
        this.launchDateUtc,
        this.launchDateLocal,
        this.isTentative,
        this.tentativeMaxPrecision,
        this.tbd,
        this.launchWindow,
        this.rocket,
        this.ships,
        this.telemetry,
        this.launchSite,
        this.launchSuccess,
        this.launchFailureDetails,
        this.links,
        this.details,
        this.staticFireDateUtc,
        this.staticFireDateUnix,
        this.timeline,
        this.crew,
        this.lastDateUpdate,
        this.lastLlLaunchDate,
        this.lastLlUpdate,
        this.lastWikiLaunchDate,
        this.lastWikiRevision,
        this.lastWikiUpdate,
        this.launchDateSource,
    });

    int flightNumber;
    String missionName;
    List<String> missionId;
    bool upcoming;
    String launchYear;
    int launchDateUnix;
    DateTime launchDateUtc;
    DateTime launchDateLocal;
    bool isTentative;
    TentativeMaxPrecision tentativeMaxPrecision;
    bool tbd;
    int launchWindow;
    Rocket rocket;
    List<String> ships;
    Telemetry telemetry;
    LaunchSite launchSite;
    bool launchSuccess;
    LaunchFailureDetails launchFailureDetails;
    Links links;
    String details;
    DateTime staticFireDateUtc;
    int staticFireDateUnix;
    Map<String, int> timeline;
    List<dynamic> crew;
    DateTime lastDateUpdate;
    DateTime lastLlLaunchDate;
    DateTime lastLlUpdate;
    DateTime lastWikiLaunchDate;
    String lastWikiRevision;
    DateTime lastWikiUpdate;
    LaunchDateSource launchDateSource;

    factory Launch.fromRawJson(String str) => Launch.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Launch.fromJson(Map<String, dynamic> json) => Launch(
        flightNumber: json["flight_number"] == null ? null : json["flight_number"],
        missionName: json["mission_name"] == null ? null : json["mission_name"],
        missionId: json["mission_id"] == null ? null : List<String>.from(json["mission_id"].map((x) => x)),
        upcoming: json["upcoming"] == null ? null : json["upcoming"],
        launchYear: json["launch_year"] == null ? null : json["launch_year"],
        launchDateUnix: json["launch_date_unix"] == null ? null : json["launch_date_unix"],
        launchDateUtc: json["launch_date_utc"] == null ? null : DateTime.parse(json["launch_date_utc"]),
        launchDateLocal: json["launch_date_local"] == null ? null : DateTime.parse(json["launch_date_local"]),
        isTentative: json["is_tentative"] == null ? null : json["is_tentative"],
        tentativeMaxPrecision: json["tentative_max_precision"] == null ? null : tentativeMaxPrecisionValues.map[json["tentative_max_precision"]],
        tbd: json["tbd"] == null ? null : json["tbd"],
        launchWindow: json["launch_window"] == null ? null : json["launch_window"],
        rocket: json["rocket"] == null ? null : Rocket.fromJson(json["rocket"]),
        ships: json["ships"] == null ? null : List<String>.from(json["ships"].map((x) => x)),
        telemetry: json["telemetry"] == null ? null : Telemetry.fromJson(json["telemetry"]),
        launchSite: json["launch_site"] == null ? null : LaunchSite.fromJson(json["launch_site"]),
        launchSuccess: json["launch_success"] == null ? null : json["launch_success"],
        launchFailureDetails: json["launch_failure_details"] == null ? null : LaunchFailureDetails.fromJson(json["launch_failure_details"]),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        details: json["details"] == null ? null : json["details"],
        staticFireDateUtc: json["static_fire_date_utc"] == null ? null : DateTime.parse(json["static_fire_date_utc"]),
        staticFireDateUnix: json["static_fire_date_unix"] == null ? null : json["static_fire_date_unix"],
        timeline: json["timeline"] == null ? null : Map.from(json["timeline"]).map((k, v) => MapEntry<String, int>(k, v == null ? null : v)),
        crew: json["crew"] == null ? null : List<dynamic>.from(json["crew"].map((x) => x)),
        lastDateUpdate: json["last_date_update"] == null ? null : DateTime.parse(json["last_date_update"]),
        lastLlLaunchDate: json["last_ll_launch_date"] == null ? null : DateTime.parse(json["last_ll_launch_date"]),
        lastLlUpdate: json["last_ll_update"] == null ? null : DateTime.parse(json["last_ll_update"]),
        lastWikiLaunchDate: json["last_wiki_launch_date"] == null ? null : DateTime.parse(json["last_wiki_launch_date"]),
        lastWikiRevision: json["last_wiki_revision"] == null ? null : json["last_wiki_revision"],
        lastWikiUpdate: json["last_wiki_update"] == null ? null : DateTime.parse(json["last_wiki_update"]),
        launchDateSource: json["launch_date_source"] == null ? null : launchDateSourceValues.map[json["launch_date_source"]],
    );

    Map<String, dynamic> toJson() => {
        "flight_number": flightNumber == null ? null : flightNumber,
        "mission_name": missionName == null ? null : missionName,
        "mission_id": missionId == null ? null : List<dynamic>.from(missionId.map((x) => x)),
        "upcoming": upcoming == null ? null : upcoming,
        "launch_year": launchYear == null ? null : launchYear,
        "launch_date_unix": launchDateUnix == null ? null : launchDateUnix,
        "launch_date_utc": launchDateUtc == null ? null : launchDateUtc.toIso8601String(),
        "launch_date_local": launchDateLocal == null ? null : launchDateLocal.toIso8601String(),
        "is_tentative": isTentative == null ? null : isTentative,
        "tentative_max_precision": tentativeMaxPrecision == null ? null : tentativeMaxPrecisionValues.reverse[tentativeMaxPrecision],
        "tbd": tbd == null ? null : tbd,
        "launch_window": launchWindow == null ? null : launchWindow,
        "rocket": rocket == null ? null : rocket.toJson(),
        "ships": ships == null ? null : List<dynamic>.from(ships.map((x) => x)),
        "telemetry": telemetry == null ? null : telemetry.toJson(),
        "launch_site": launchSite == null ? null : launchSite.toJson(),
        "launch_success": launchSuccess == null ? null : launchSuccess,
        "launch_failure_details": launchFailureDetails == null ? null : launchFailureDetails.toJson(),
        "links": links == null ? null : links.toJson(),
        "details": details == null ? null : details,
        "static_fire_date_utc": staticFireDateUtc == null ? null : staticFireDateUtc.toIso8601String(),
        "static_fire_date_unix": staticFireDateUnix == null ? null : staticFireDateUnix,
        "timeline": timeline == null ? null : Map.from(timeline).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)),
        "crew": crew == null ? null : List<dynamic>.from(crew.map((x) => x)),
        "last_date_update": lastDateUpdate == null ? null : lastDateUpdate.toIso8601String(),
        "last_ll_launch_date": lastLlLaunchDate == null ? null : lastLlLaunchDate.toIso8601String(),
        "last_ll_update": lastLlUpdate == null ? null : lastLlUpdate.toIso8601String(),
        "last_wiki_launch_date": lastWikiLaunchDate == null ? null : lastWikiLaunchDate.toIso8601String(),
        "last_wiki_revision": lastWikiRevision == null ? null : lastWikiRevision,
        "last_wiki_update": lastWikiUpdate == null ? null : lastWikiUpdate.toIso8601String(),
        "launch_date_source": launchDateSource == null ? null : launchDateSourceValues.reverse[launchDateSource],
    };
}

enum LaunchDateSource { WIKI, LAUNCH_LIBRARY }

final launchDateSourceValues = EnumValues({
    "launch_library": LaunchDateSource.LAUNCH_LIBRARY,
    "wiki": LaunchDateSource.WIKI
});

class LaunchFailureDetails {
    LaunchFailureDetails({
        this.time,
        this.altitude,
        this.reason,
    });

    int time;
    int altitude;
    String reason;

    factory LaunchFailureDetails.fromRawJson(String str) => LaunchFailureDetails.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LaunchFailureDetails.fromJson(Map<String, dynamic> json) => LaunchFailureDetails(
        time: json["time"] == null ? null : json["time"],
        altitude: json["altitude"] == null ? null : json["altitude"],
        reason: json["reason"] == null ? null : json["reason"],
    );

    Map<String, dynamic> toJson() => {
        "time": time == null ? null : time,
        "altitude": altitude == null ? null : altitude,
        "reason": reason == null ? null : reason,
    };
}

class LaunchSite {
    LaunchSite({
        this.siteId,
        this.siteName,
        this.siteNameLong,
    });

    SiteId siteId;
    SiteName siteName;
    SiteNameLong siteNameLong;

    factory LaunchSite.fromRawJson(String str) => LaunchSite.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LaunchSite.fromJson(Map<String, dynamic> json) => LaunchSite(
        siteId: json["site_id"] == null ? null : siteIdValues.map[json["site_id"]],
        siteName: json["site_name"] == null ? null : siteNameValues.map[json["site_name"]],
        siteNameLong: json["site_name_long"] == null ? null : siteNameLongValues.map[json["site_name_long"]],
    );

    Map<String, dynamic> toJson() => {
        "site_id": siteId == null ? null : siteIdValues.reverse[siteId],
        "site_name": siteName == null ? null : siteNameValues.reverse[siteName],
        "site_name_long": siteNameLong == null ? null : siteNameLongValues.reverse[siteNameLong],
    };
}

enum SiteId { KWAJALEIN_ATOLL, CCAFS_SLC_40, VAFB_SLC_4_E, KSC_LC_39_A }

final siteIdValues = EnumValues({
    "ccafs_slc_40": SiteId.CCAFS_SLC_40,
    "ksc_lc_39a": SiteId.KSC_LC_39_A,
    "kwajalein_atoll": SiteId.KWAJALEIN_ATOLL,
    "vafb_slc_4e": SiteId.VAFB_SLC_4_E
});

enum SiteName { KWAJALEIN_ATOLL, CCAFS_SLC_40, VAFB_SLC_4_E, KSC_LC_39_A }

final siteNameValues = EnumValues({
    "CCAFS SLC 40": SiteName.CCAFS_SLC_40,
    "KSC LC 39A": SiteName.KSC_LC_39_A,
    "Kwajalein Atoll": SiteName.KWAJALEIN_ATOLL,
    "VAFB SLC 4E": SiteName.VAFB_SLC_4_E
});

enum SiteNameLong { KWAJALEIN_ATOLL_OMELEK_ISLAND, CAPE_CANAVERAL_AIR_FORCE_STATION_SPACE_LAUNCH_COMPLEX_40, VANDENBERG_AIR_FORCE_BASE_SPACE_LAUNCH_COMPLEX_4_E, KENNEDY_SPACE_CENTER_HISTORIC_LAUNCH_COMPLEX_39_A }

final siteNameLongValues = EnumValues({
    "Cape Canaveral Air Force Station Space Launch Complex 40": SiteNameLong.CAPE_CANAVERAL_AIR_FORCE_STATION_SPACE_LAUNCH_COMPLEX_40,
    "Kennedy Space Center Historic Launch Complex 39A": SiteNameLong.KENNEDY_SPACE_CENTER_HISTORIC_LAUNCH_COMPLEX_39_A,
    "Kwajalein Atoll Omelek Island": SiteNameLong.KWAJALEIN_ATOLL_OMELEK_ISLAND,
    "Vandenberg Air Force Base Space Launch Complex 4E": SiteNameLong.VANDENBERG_AIR_FORCE_BASE_SPACE_LAUNCH_COMPLEX_4_E
});

class Links {
    Links({
        this.missionPatch,
        this.missionPatchSmall,
        this.redditCampaign,
        this.redditLaunch,
        this.redditRecovery,
        this.redditMedia,
        this.presskit,
        this.articleLink,
        this.wikipedia,
        this.videoLink,
        this.youtubeId,
        this.flickrImages,
    });

    String missionPatch;
    String missionPatchSmall;
    String redditCampaign;
    String redditLaunch;
    String redditRecovery;
    String redditMedia;
    String presskit;
    String articleLink;
    String wikipedia;
    String videoLink;
    String youtubeId;
    List<String> flickrImages;

    factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        missionPatch: json["mission_patch"] == null ? null : json["mission_patch"],
        missionPatchSmall: json["mission_patch_small"] == null ? null : json["mission_patch_small"],
        redditCampaign: json["reddit_campaign"] == null ? null : json["reddit_campaign"],
        redditLaunch: json["reddit_launch"] == null ? null : json["reddit_launch"],
        redditRecovery: json["reddit_recovery"] == null ? null : json["reddit_recovery"],
        redditMedia: json["reddit_media"] == null ? null : json["reddit_media"],
        presskit: json["presskit"] == null ? null : json["presskit"],
        articleLink: json["article_link"] == null ? null : json["article_link"],
        wikipedia: json["wikipedia"] == null ? null : json["wikipedia"],
        videoLink: json["video_link"] == null ? null : json["video_link"],
        youtubeId: json["youtube_id"] == null ? null : json["youtube_id"],
        flickrImages: json["flickr_images"] == null ? null : List<String>.from(json["flickr_images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "mission_patch": missionPatch == null ? null : missionPatch,
        "mission_patch_small": missionPatchSmall == null ? null : missionPatchSmall,
        "reddit_campaign": redditCampaign == null ? null : redditCampaign,
        "reddit_launch": redditLaunch == null ? null : redditLaunch,
        "reddit_recovery": redditRecovery == null ? null : redditRecovery,
        "reddit_media": redditMedia == null ? null : redditMedia,
        "presskit": presskit == null ? null : presskit,
        "article_link": articleLink == null ? null : articleLink,
        "wikipedia": wikipedia == null ? null : wikipedia,
        "video_link": videoLink == null ? null : videoLink,
        "youtube_id": youtubeId == null ? null : youtubeId,
        "flickr_images": flickrImages == null ? null : List<dynamic>.from(flickrImages.map((x) => x)),
    };
}

class Rocket {
    Rocket({
        this.rocketId,
        this.rocketName,
        this.rocketType,
        this.firstStage,
        this.secondStage,
        this.fairings,
    });

    RocketId rocketId;
    RocketName rocketName;
    RocketType rocketType;
    FirstStage firstStage;
    SecondStage secondStage;
    Fairings fairings;

    factory Rocket.fromRawJson(String str) => Rocket.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Rocket.fromJson(Map<String, dynamic> json) => Rocket(
        rocketId: json["rocket_id"] == null ? null : rocketIdValues.map[json["rocket_id"]],
        rocketName: json["rocket_name"] == null ? null : rocketNameValues.map[json["rocket_name"]],
        rocketType: json["rocket_type"] == null ? null : rocketTypeValues.map[json["rocket_type"]],
        firstStage: json["first_stage"] == null ? null : FirstStage.fromJson(json["first_stage"]),
        secondStage: json["second_stage"] == null ? null : SecondStage.fromJson(json["second_stage"]),
        fairings: json["fairings"] == null ? null : Fairings.fromJson(json["fairings"]),
    );

    Map<String, dynamic> toJson() => {
        "rocket_id": rocketId == null ? null : rocketIdValues.reverse[rocketId],
        "rocket_name": rocketName == null ? null : rocketNameValues.reverse[rocketName],
        "rocket_type": rocketType == null ? null : rocketTypeValues.reverse[rocketType],
        "first_stage": firstStage == null ? null : firstStage.toJson(),
        "second_stage": secondStage == null ? null : secondStage.toJson(),
        "fairings": fairings == null ? null : fairings.toJson(),
    };
}

class Fairings {
    Fairings({
        this.reused,
        this.recoveryAttempt,
        this.recovered,
        this.ship,
    });

    bool reused;
    bool recoveryAttempt;
    bool recovered;
    Ship ship;

    factory Fairings.fromRawJson(String str) => Fairings.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Fairings.fromJson(Map<String, dynamic> json) => Fairings(
        reused: json["reused"] == null ? null : json["reused"],
        recoveryAttempt: json["recovery_attempt"] == null ? null : json["recovery_attempt"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        ship: json["ship"] == null ? null : shipValues.map[json["ship"]],
    );

    Map<String, dynamic> toJson() => {
        "reused": reused == null ? null : reused,
        "recovery_attempt": recoveryAttempt == null ? null : recoveryAttempt,
        "recovered": recovered == null ? null : recovered,
        "ship": ship == null ? null : shipValues.reverse[ship],
    };
}

enum Ship { GOMSTREE, GOSEARCHER }

final shipValues = EnumValues({
    "GOMSTREE": Ship.GOMSTREE,
    "GOSEARCHER": Ship.GOSEARCHER
});

class FirstStage {
    FirstStage({
        this.cores,
    });

    List<Core> cores;

    factory FirstStage.fromRawJson(String str) => FirstStage.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FirstStage.fromJson(Map<String, dynamic> json) => FirstStage(
        cores: json["cores"] == null ? null : List<Core>.from(json["cores"].map((x) => Core.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cores": cores == null ? null : List<dynamic>.from(cores.map((x) => x.toJson())),
    };
}

class Core {
    Core({
        this.coreSerial,
        this.flight,
        this.block,
        this.gridfins,
        this.legs,
        this.reused,
        this.landSuccess,
        this.landingIntent,
        this.landingType,
        this.landingVehicle,
    });

    String coreSerial;
    int flight;
    int block;
    bool gridfins;
    bool legs;
    bool reused;
    bool landSuccess;
    bool landingIntent;
    LandingType landingType;
    LandingVehicle landingVehicle;

    factory Core.fromRawJson(String str) => Core.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Core.fromJson(Map<String, dynamic> json) => Core(
        coreSerial: json["core_serial"] == null ? null : json["core_serial"],
        flight: json["flight"] == null ? null : json["flight"],
        block: json["block"] == null ? null : json["block"],
        gridfins: json["gridfins"] == null ? null : json["gridfins"],
        legs: json["legs"] == null ? null : json["legs"],
        reused: json["reused"] == null ? null : json["reused"],
        landSuccess: json["land_success"] == null ? null : json["land_success"],
        landingIntent: json["landing_intent"] == null ? null : json["landing_intent"],
        landingType: json["landing_type"] == null ? null : landingTypeValues.map[json["landing_type"]],
        landingVehicle: json["landing_vehicle"] == null ? null : landingVehicleValues.map[json["landing_vehicle"]],
    );

    Map<String, dynamic> toJson() => {
        "core_serial": coreSerial == null ? null : coreSerial,
        "flight": flight == null ? null : flight,
        "block": block == null ? null : block,
        "gridfins": gridfins == null ? null : gridfins,
        "legs": legs == null ? null : legs,
        "reused": reused == null ? null : reused,
        "land_success": landSuccess == null ? null : landSuccess,
        "landing_intent": landingIntent == null ? null : landingIntent,
        "landing_type": landingType == null ? null : landingTypeValues.reverse[landingType],
        "landing_vehicle": landingVehicle == null ? null : landingVehicleValues.reverse[landingVehicle],
    };
}

enum LandingType { OCEAN, ASDS, RTLS }

final landingTypeValues = EnumValues({
    "ASDS": LandingType.ASDS,
    "Ocean": LandingType.OCEAN,
    "RTLS": LandingType.RTLS
});

enum LandingVehicle { JRTI_1, OCISLY, LZ_1, JRTI, LZ_2, LZ_4 }

final landingVehicleValues = EnumValues({
    "JRTI": LandingVehicle.JRTI,
    "JRTI-1": LandingVehicle.JRTI_1,
    "LZ-1": LandingVehicle.LZ_1,
    "LZ-2": LandingVehicle.LZ_2,
    "LZ-4": LandingVehicle.LZ_4,
    "OCISLY": LandingVehicle.OCISLY
});

enum RocketId { FALCON1, FALCON9, FALCONHEAVY }

final rocketIdValues = EnumValues({
    "falcon1": RocketId.FALCON1,
    "falcon9": RocketId.FALCON9,
    "falconheavy": RocketId.FALCONHEAVY
});

enum RocketName { FALCON_1, FALCON_9, FALCON_HEAVY }

final rocketNameValues = EnumValues({
    "Falcon 1": RocketName.FALCON_1,
    "Falcon 9": RocketName.FALCON_9,
    "Falcon Heavy": RocketName.FALCON_HEAVY
});

enum RocketType { MERLIN_A, MERLIN_C, V1_0, V1_1, FT }

final rocketTypeValues = EnumValues({
    "FT": RocketType.FT,
    "Merlin A": RocketType.MERLIN_A,
    "Merlin C": RocketType.MERLIN_C,
    "v1.0": RocketType.V1_0,
    "v1.1": RocketType.V1_1
});

class SecondStage {
    SecondStage({
        this.block,
        this.payloads,
    });

    int block;
    List<Payload> payloads;

    factory SecondStage.fromRawJson(String str) => SecondStage.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SecondStage.fromJson(Map<String, dynamic> json) => SecondStage(
        block: json["block"] == null ? null : json["block"],
        payloads: json["payloads"] == null ? null : List<Payload>.from(json["payloads"].map((x) => Payload.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "block": block == null ? null : block,
        "payloads": payloads == null ? null : List<dynamic>.from(payloads.map((x) => x.toJson())),
    };
}

class Payload {
    Payload({
        this.payloadId,
        this.noradId,
        this.reused,
        this.customers,
        this.nationality,
        this.manufacturer,
        this.payloadType,
        this.payloadMassKg,
        this.payloadMassLbs,
        this.orbit,
        this.orbitParams,
        this.capSerial,
        this.massReturnedKg,
        this.massReturnedLbs,
        this.flightTimeSec,
        this.cargoManifest,
        this.uid,
    });

    String payloadId;
    List<int> noradId;
    bool reused;
    List<String> customers;
    String nationality;
    String manufacturer;
    PayloadType payloadType;
    double payloadMassKg;
    double payloadMassLbs;
    String orbit;
    OrbitParams orbitParams;
    String capSerial;
    double massReturnedKg;
    double massReturnedLbs;
    int flightTimeSec;
    String cargoManifest;
    String uid;

    factory Payload.fromRawJson(String str) => Payload.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        payloadId: json["payload_id"] == null ? null : json["payload_id"],
        noradId: json["norad_id"] == null ? null : List<int>.from(json["norad_id"].map((x) => x)),
        reused: json["reused"] == null ? null : json["reused"],
        customers: json["customers"] == null ? null : List<String>.from(json["customers"].map((x) => x)),
        nationality: json["nationality"] == null ? null : json["nationality"],
        manufacturer: json["manufacturer"] == null ? null : json["manufacturer"],
        payloadType: json["payload_type"] == null ? null : payloadTypeValues.map[json["payload_type"]],
        payloadMassKg: json["payload_mass_kg"] == null ? null : json["payload_mass_kg"].toDouble(),
        payloadMassLbs: json["payload_mass_lbs"] == null ? null : json["payload_mass_lbs"].toDouble(),
        orbit: json["orbit"] == null ? null : json["orbit"],
        orbitParams: json["orbit_params"] == null ? null : OrbitParams.fromJson(json["orbit_params"]),
        capSerial: json["cap_serial"] == null ? null : json["cap_serial"],
        massReturnedKg: json["mass_returned_kg"] == null ? null : json["mass_returned_kg"].toDouble(),
        massReturnedLbs: json["mass_returned_lbs"] == null ? null : json["mass_returned_lbs"].toDouble(),
        flightTimeSec: json["flight_time_sec"] == null ? null : json["flight_time_sec"],
        cargoManifest: json["cargo_manifest"] == null ? null : json["cargo_manifest"],
        uid: json["uid"] == null ? null : json["uid"],
    );

    Map<String, dynamic> toJson() => {
        "payload_id": payloadId == null ? null : payloadId,
        "norad_id": noradId == null ? null : List<dynamic>.from(noradId.map((x) => x)),
        "reused": reused == null ? null : reused,
        "customers": customers == null ? null : List<dynamic>.from(customers.map((x) => x)),
        "nationality": nationality == null ? null : nationality,
        "manufacturer": manufacturer == null ? null : manufacturer,
        "payload_type": payloadType == null ? null : payloadTypeValues.reverse[payloadType],
        "payload_mass_kg": payloadMassKg == null ? null : payloadMassKg,
        "payload_mass_lbs": payloadMassLbs == null ? null : payloadMassLbs,
        "orbit": orbit == null ? null : orbit,
        "orbit_params": orbitParams == null ? null : orbitParams.toJson(),
        "cap_serial": capSerial == null ? null : capSerial,
        "mass_returned_kg": massReturnedKg == null ? null : massReturnedKg,
        "mass_returned_lbs": massReturnedLbs == null ? null : massReturnedLbs,
        "flight_time_sec": flightTimeSec == null ? null : flightTimeSec,
        "cargo_manifest": cargoManifest == null ? null : cargoManifest,
        "uid": uid == null ? null : uid,
    };
}

class OrbitParams {
    OrbitParams({
        this.referenceSystem,
        this.regime,
        this.longitude,
        this.semiMajorAxisKm,
        this.eccentricity,
        this.periapsisKm,
        this.apoapsisKm,
        this.inclinationDeg,
        this.periodMin,
        this.lifespanYears,
        this.epoch,
        this.meanMotion,
        this.raan,
        this.argOfPericenter,
        this.meanAnomaly,
    });

    ReferenceSystem referenceSystem;
    Regime regime;
    double longitude;
    double semiMajorAxisKm;
    double eccentricity;
    double periapsisKm;
    double apoapsisKm;
    double inclinationDeg;
    double periodMin;
    double lifespanYears;
    DateTime epoch;
    double meanMotion;
    double raan;
    double argOfPericenter;
    double meanAnomaly;

    factory OrbitParams.fromRawJson(String str) => OrbitParams.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrbitParams.fromJson(Map<String, dynamic> json) => OrbitParams(
        referenceSystem: json["reference_system"] == null ? null : referenceSystemValues.map[json["reference_system"]],
        regime: json["regime"] == null ? null : regimeValues.map[json["regime"]],
        longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
        semiMajorAxisKm: json["semi_major_axis_km"] == null ? null : json["semi_major_axis_km"].toDouble(),
        eccentricity: json["eccentricity"] == null ? null : json["eccentricity"].toDouble(),
        periapsisKm: json["periapsis_km"] == null ? null : json["periapsis_km"].toDouble(),
        apoapsisKm: json["apoapsis_km"] == null ? null : json["apoapsis_km"].toDouble(),
        inclinationDeg: json["inclination_deg"] == null ? null : json["inclination_deg"].toDouble(),
        periodMin: json["period_min"] == null ? null : json["period_min"].toDouble(),
        lifespanYears: json["lifespan_years"] == null ? null : json["lifespan_years"].toDouble(),
        epoch: json["epoch"] == null ? null : DateTime.parse(json["epoch"]),
        meanMotion: json["mean_motion"] == null ? null : json["mean_motion"].toDouble(),
        raan: json["raan"] == null ? null : json["raan"].toDouble(),
        argOfPericenter: json["arg_of_pericenter"] == null ? null : json["arg_of_pericenter"].toDouble(),
        meanAnomaly: json["mean_anomaly"] == null ? null : json["mean_anomaly"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "reference_system": referenceSystem == null ? null : referenceSystemValues.reverse[referenceSystem],
        "regime": regime == null ? null : regimeValues.reverse[regime],
        "longitude": longitude == null ? null : longitude,
        "semi_major_axis_km": semiMajorAxisKm == null ? null : semiMajorAxisKm,
        "eccentricity": eccentricity == null ? null : eccentricity,
        "periapsis_km": periapsisKm == null ? null : periapsisKm,
        "apoapsis_km": apoapsisKm == null ? null : apoapsisKm,
        "inclination_deg": inclinationDeg == null ? null : inclinationDeg,
        "period_min": periodMin == null ? null : periodMin,
        "lifespan_years": lifespanYears == null ? null : lifespanYears,
        "epoch": epoch == null ? null : epoch.toIso8601String(),
        "mean_motion": meanMotion == null ? null : meanMotion,
        "raan": raan == null ? null : raan,
        "arg_of_pericenter": argOfPericenter == null ? null : argOfPericenter,
        "mean_anomaly": meanAnomaly == null ? null : meanAnomaly,
    };
}

enum ReferenceSystem { GEOCENTRIC, HELIOCENTRIC, HIGHLY_ELLIPTICAL }

final referenceSystemValues = EnumValues({
    "geocentric": ReferenceSystem.GEOCENTRIC,
    "heliocentric": ReferenceSystem.HELIOCENTRIC,
    "highly-elliptical": ReferenceSystem.HIGHLY_ELLIPTICAL
});

enum Regime { LOW_EARTH, GEOSTATIONARY, L1_POINT, GEOSYNCHRONOUS, SUN_SYNCHRONOUS, HIGH_EARTH, SEMI_SYNCHRONOUS, HIGHLY_ELLIPTICAL, VERY_LOW_EARTH, MEDIUM_EARTH, SUB_ORBITAL }

final regimeValues = EnumValues({
    "geostationary": Regime.GEOSTATIONARY,
    "geosynchronous": Regime.GEOSYNCHRONOUS,
    "highly-elliptical": Regime.HIGHLY_ELLIPTICAL,
    "high-earth": Regime.HIGH_EARTH,
    "L1-point": Regime.L1_POINT,
    "low-earth": Regime.LOW_EARTH,
    "medium-earth": Regime.MEDIUM_EARTH,
    "semi-synchronous": Regime.SEMI_SYNCHRONOUS,
    "sub-orbital": Regime.SUB_ORBITAL,
    "sun-synchronous": Regime.SUN_SYNCHRONOUS,
    "very-low-earth": Regime.VERY_LOW_EARTH
});

enum PayloadType { SATELLITE, DRAGON_BOILERPLATE, DRAGON_10, DRAGON_11, LANDER, CREW_DRAGON }

final payloadTypeValues = EnumValues({
    "Crew Dragon": PayloadType.CREW_DRAGON,
    "Dragon 1.0": PayloadType.DRAGON_10,
    "Dragon 1.1": PayloadType.DRAGON_11,
    "Dragon Boilerplate": PayloadType.DRAGON_BOILERPLATE,
    "Lander": PayloadType.LANDER,
    "Satellite": PayloadType.SATELLITE
});

class Telemetry {
    Telemetry({
        this.flightClub,
    });

    String flightClub;

    factory Telemetry.fromRawJson(String str) => Telemetry.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Telemetry.fromJson(Map<String, dynamic> json) => Telemetry(
        flightClub: json["flight_club"] == null ? null : json["flight_club"],
    );

    Map<String, dynamic> toJson() => {
        "flight_club": flightClub == null ? null : flightClub,
    };
}

enum TentativeMaxPrecision { HOUR, MONTH, DAY, YEAR, QUARTER }

final tentativeMaxPrecisionValues = EnumValues({
    "day": TentativeMaxPrecision.DAY,
    "hour": TentativeMaxPrecision.HOUR,
    "month": TentativeMaxPrecision.MONTH,
    "quarter": TentativeMaxPrecision.QUARTER,
    "year": TentativeMaxPrecision.YEAR
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
