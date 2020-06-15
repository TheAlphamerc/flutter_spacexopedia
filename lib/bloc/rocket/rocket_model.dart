import 'dart:convert';

class RocketModel {
    RocketModel({
        this.id,
        this.active,
        this.stages,
        this.boosters,
        this.costPerLaunch,
        this.successRatePct,
        this.firstFlight,
        this.country,
        this.company,
        this.height,
        this.diameter,
        this.mass,
        this.payloadWeights,
        this.firstStage,
        this.secondStage,
        this.engines,
        this.landingLegs,
        this.flickrImages,
        this.wikipedia,
        this.description,
        this.rocketId,
        this.rocketName,
        this.rocketType,
    });

    int id;
    bool active;
    int stages;
    int boosters;
    int costPerLaunch;
    int successRatePct;
    DateTime firstFlight;
    String country;
    String company;
    Diameter height;
    Diameter diameter;
    Mass mass;
    List<PayloadWeight> payloadWeights;
    FirstStage firstStage;
    SecondStage secondStage;
    Engines engines;
    LandingLegs landingLegs;
    List<String> flickrImages;
    String wikipedia;
    String description;
    String rocketId;
    String rocketName;
    String rocketType;

    factory RocketModel.fromRawJson(String str) => RocketModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RocketModel.fromJson(Map<String, dynamic> json) => RocketModel(
        id: json["id"] == null ? null : json["id"],
        active: json["active"] == null ? null : json["active"],
        stages: json["stages"] == null ? null : json["stages"],
        boosters: json["boosters"] == null ? null : json["boosters"],
        costPerLaunch: json["cost_per_launch"] == null ? null : json["cost_per_launch"],
        successRatePct: json["success_rate_pct"] == null ? null : json["success_rate_pct"],
        firstFlight: json["first_flight"] == null ? null : DateTime.parse(json["first_flight"]),
        country: json["country"] == null ? null : json["country"],
        company: json["company"] == null ? null : json["company"],
        height: json["height"] == null ? null : Diameter.fromJson(json["height"]),
        diameter: json["diameter"] == null ? null : Diameter.fromJson(json["diameter"]),
        mass: json["mass"] == null ? null : Mass.fromJson(json["mass"]),
        payloadWeights: json["payload_weights"] == null ? null : List<PayloadWeight>.from(json["payload_weights"].map((x) => PayloadWeight.fromJson(x))),
        firstStage: json["first_stage"] == null ? null : FirstStage.fromJson(json["first_stage"]),
        secondStage: json["second_stage"] == null ? null : SecondStage.fromJson(json["second_stage"]),
        engines: json["engines"] == null ? null : Engines.fromJson(json["engines"]),
        landingLegs: json["landing_legs"] == null ? null : LandingLegs.fromJson(json["landing_legs"]),
        flickrImages: json["flickr_images"] == null ? null : List<String>.from(json["flickr_images"].map((x) => x)),
        wikipedia: json["wikipedia"] == null ? null : json["wikipedia"],
        description: json["description"] == null ? null : json["description"],
        rocketId: json["rocket_id"] == null ? null : json["rocket_id"],
        rocketName: json["rocket_name"] == null ? null : json["rocket_name"],
        rocketType: json["rocket_type"] == null ? null : json["rocket_type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "active": active == null ? null : active,
        "stages": stages == null ? null : stages,
        "boosters": boosters == null ? null : boosters,
        "cost_per_launch": costPerLaunch == null ? null : costPerLaunch,
        "success_rate_pct": successRatePct == null ? null : successRatePct,
        "first_flight": firstFlight == null ? null : "${firstFlight.year.toString().padLeft(4, '0')}-${firstFlight.month.toString().padLeft(2, '0')}-${firstFlight.day.toString().padLeft(2, '0')}",
        "country": country == null ? null : country,
        "company": company == null ? null : company,
        "height": height == null ? null : height.toJson(),
        "diameter": diameter == null ? null : diameter.toJson(),
        "mass": mass == null ? null : mass.toJson(),
        "payload_weights": payloadWeights == null ? null : List<dynamic>.from(payloadWeights.map((x) => x.toJson())),
        "first_stage": firstStage == null ? null : firstStage.toJson(),
        "second_stage": secondStage == null ? null : secondStage.toJson(),
        "engines": engines == null ? null : engines.toJson(),
        "landing_legs": landingLegs == null ? null : landingLegs.toJson(),
        "flickr_images": flickrImages == null ? null : List<dynamic>.from(flickrImages.map((x) => x)),
        "wikipedia": wikipedia == null ? null : wikipedia,
        "description": description == null ? null : description,
        "rocket_id": rocketId == null ? null : rocketId,
        "rocket_name": rocketName == null ? null : rocketName,
        "rocket_type": rocketType == null ? null : rocketType,
    };
}

class Diameter {
    Diameter({
        this.meters,
        this.feet,
    });

    double meters;
    double feet;

    factory Diameter.fromRawJson(String str) => Diameter.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Diameter.fromJson(Map<String, dynamic> json) => Diameter(
        meters: json["meters"] == null ? null : json["meters"].toDouble(),
        feet: json["feet"] == null ? null : json["feet"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "meters": meters == null ? null : meters,
        "feet": feet == null ? null : feet,
    };
}

class Engines {
    Engines({
        this.number,
        this.type,
        this.version,
        this.layout,
        this.isp,
        this.engineLossMax,
        this.propellant1,
        this.propellant2,
        this.thrustSeaLevel,
        this.thrustVacuum,
        this.thrustToWeight,
    });

    int number;
    String type;
    String version;
    String layout;
    Isp isp;
    int engineLossMax;
    String propellant1;
    String propellant2;
    Thrust thrustSeaLevel;
    Thrust thrustVacuum;
    double thrustToWeight;

    factory Engines.fromRawJson(String str) => Engines.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Engines.fromJson(Map<String, dynamic> json) => Engines(
        number: json["number"] == null ? null : json["number"],
        type: json["type"] == null ? null : json["type"],
        version: json["version"] == null ? null : json["version"],
        layout: json["layout"] == null ? null : json["layout"],
        isp: json["isp"] == null ? null : Isp.fromJson(json["isp"]),
        engineLossMax: json["engine_loss_max"] == null ? null : json["engine_loss_max"],
        propellant1: json["propellant_1"] == null ? null : json["propellant_1"],
        propellant2: json["propellant_2"] == null ? null : json["propellant_2"],
        thrustSeaLevel: json["thrust_sea_level"] == null ? null : Thrust.fromJson(json["thrust_sea_level"]),
        thrustVacuum: json["thrust_vacuum"] == null ? null : Thrust.fromJson(json["thrust_vacuum"]),
        thrustToWeight: json["thrust_to_weight"] == null ? null : json["thrust_to_weight"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "number": number == null ? null : number,
        "type": type == null ? null : type,
        "version": version == null ? null : version,
        "layout": layout == null ? null : layout,
        "isp": isp == null ? null : isp.toJson(),
        "engine_loss_max": engineLossMax == null ? null : engineLossMax,
        "propellant_1": propellant1 == null ? null : propellant1,
        "propellant_2": propellant2 == null ? null : propellant2,
        "thrust_sea_level": thrustSeaLevel == null ? null : thrustSeaLevel.toJson(),
        "thrust_vacuum": thrustVacuum == null ? null : thrustVacuum.toJson(),
        "thrust_to_weight": thrustToWeight == null ? null : thrustToWeight,
    };
}

class Isp {
    Isp({
        this.seaLevel,
        this.vacuum,
    });

    int seaLevel;
    int vacuum;

    factory Isp.fromRawJson(String str) => Isp.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Isp.fromJson(Map<String, dynamic> json) => Isp(
        seaLevel: json["sea_level"] == null ? null : json["sea_level"],
        vacuum: json["vacuum"] == null ? null : json["vacuum"],
    );

    Map<String, dynamic> toJson() => {
        "sea_level": seaLevel == null ? null : seaLevel,
        "vacuum": vacuum == null ? null : vacuum,
    };
}

class Thrust {
    Thrust({
        this.kN,
        this.lbf,
    });

    int kN;
    int lbf;

    factory Thrust.fromRawJson(String str) => Thrust.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Thrust.fromJson(Map<String, dynamic> json) => Thrust(
        kN: json["kN"] == null ? null : json["kN"],
        lbf: json["lbf"] == null ? null : json["lbf"],
    );

    Map<String, dynamic> toJson() => {
        "kN": kN == null ? null : kN,
        "lbf": lbf == null ? null : lbf,
    };
}

class FirstStage {
    FirstStage({
        this.reusable,
        this.engines,
        this.fuelAmountTons,
        this.burnTimeSec,
        this.thrustSeaLevel,
        this.thrustVacuum,
        this.cores,
    });

    bool reusable;
    int engines;
    double fuelAmountTons;
    int burnTimeSec;
    Thrust thrustSeaLevel;
    Thrust thrustVacuum;
    int cores;

    factory FirstStage.fromRawJson(String str) => FirstStage.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FirstStage.fromJson(Map<String, dynamic> json) => FirstStage(
        reusable: json["reusable"] == null ? null : json["reusable"],
        engines: json["engines"] == null ? null : json["engines"],
        fuelAmountTons: json["fuel_amount_tons"] == null ? null : json["fuel_amount_tons"].toDouble(),
        burnTimeSec: json["burn_time_sec"] == null ? null : json["burn_time_sec"],
        thrustSeaLevel: json["thrust_sea_level"] == null ? null : Thrust.fromJson(json["thrust_sea_level"]),
        thrustVacuum: json["thrust_vacuum"] == null ? null : Thrust.fromJson(json["thrust_vacuum"]),
        cores: json["cores"] == null ? null : json["cores"],
    );

    Map<String, dynamic> toJson() => {
        "reusable": reusable == null ? null : reusable,
        "engines": engines == null ? null : engines,
        "fuel_amount_tons": fuelAmountTons == null ? null : fuelAmountTons,
        "burn_time_sec": burnTimeSec == null ? null : burnTimeSec,
        "thrust_sea_level": thrustSeaLevel == null ? null : thrustSeaLevel.toJson(),
        "thrust_vacuum": thrustVacuum == null ? null : thrustVacuum.toJson(),
        "cores": cores == null ? null : cores,
    };
}

class LandingLegs {
    LandingLegs({
        this.number,
        this.material,
    });

    int number;
    String material;

    factory LandingLegs.fromRawJson(String str) => LandingLegs.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LandingLegs.fromJson(Map<String, dynamic> json) => LandingLegs(
        number: json["number"] == null ? null : json["number"],
        material: json["material"] == null ? null : json["material"],
    );

    Map<String, dynamic> toJson() => {
        "number": number == null ? null : number,
        "material": material == null ? null : material,
    };
}

class Mass {
    Mass({
        this.kg,
        this.lb,
    });

    int kg;
    int lb;

    factory Mass.fromRawJson(String str) => Mass.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Mass.fromJson(Map<String, dynamic> json) => Mass(
        kg: json["kg"] == null ? null : json["kg"],
        lb: json["lb"] == null ? null : json["lb"],
    );

    Map<String, dynamic> toJson() => {
        "kg": kg == null ? null : kg,
        "lb": lb == null ? null : lb,
    };
}

class PayloadWeight {
    PayloadWeight({
        this.id,
        this.name,
        this.kg,
        this.lb,
    });

    String id;
    String name;
    int kg;
    int lb;

    factory PayloadWeight.fromRawJson(String str) => PayloadWeight.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PayloadWeight.fromJson(Map<String, dynamic> json) => PayloadWeight(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        kg: json["kg"] == null ? null : json["kg"],
        lb: json["lb"] == null ? null : json["lb"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "kg": kg == null ? null : kg,
        "lb": lb == null ? null : lb,
    };
}

class SecondStage {
    SecondStage({
        this.reusable,
        this.engines,
        this.fuelAmountTons,
        this.burnTimeSec,
        this.thrust,
        this.payloads,
    });

    bool reusable;
    int engines;
    double fuelAmountTons;
    int burnTimeSec;
    Thrust thrust;
    Payloads payloads;

    factory SecondStage.fromRawJson(String str) => SecondStage.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SecondStage.fromJson(Map<String, dynamic> json) => SecondStage(
        reusable: json["reusable"] == null ? null : json["reusable"],
        engines: json["engines"] == null ? null : json["engines"],
        fuelAmountTons: json["fuel_amount_tons"] == null ? null : json["fuel_amount_tons"].toDouble(),
        burnTimeSec: json["burn_time_sec"] == null ? null : json["burn_time_sec"],
        thrust: json["thrust"] == null ? null : Thrust.fromJson(json["thrust"]),
        payloads: json["payloads"] == null ? null : Payloads.fromJson(json["payloads"]),
    );

    Map<String, dynamic> toJson() => {
        "reusable": reusable == null ? null : reusable,
        "engines": engines == null ? null : engines,
        "fuel_amount_tons": fuelAmountTons == null ? null : fuelAmountTons,
        "burn_time_sec": burnTimeSec == null ? null : burnTimeSec,
        "thrust": thrust == null ? null : thrust.toJson(),
        "payloads": payloads == null ? null : payloads.toJson(),
    };
}

class Payloads {
    Payloads({
        this.option1,
        this.compositeFairing,
        this.option2,
    });

    String option1;
    CompositeFairing compositeFairing;
    String option2;

    factory Payloads.fromRawJson(String str) => Payloads.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Payloads.fromJson(Map<String, dynamic> json) => Payloads(
        option1: json["option_1"] == null ? null : json["option_1"],
        compositeFairing: json["composite_fairing"] == null ? null : CompositeFairing.fromJson(json["composite_fairing"]),
        option2: json["option_2"] == null ? null : json["option_2"],
    );

    Map<String, dynamic> toJson() => {
        "option_1": option1 == null ? null : option1,
        "composite_fairing": compositeFairing == null ? null : compositeFairing.toJson(),
        "option_2": option2 == null ? null : option2,
    };
}

class CompositeFairing {
    CompositeFairing({
        this.height,
        this.diameter,
    });

    Diameter height;
    Diameter diameter;

    factory CompositeFairing.fromRawJson(String str) => CompositeFairing.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CompositeFairing.fromJson(Map<String, dynamic> json) => CompositeFairing(
        height: json["height"] == null ? null : Diameter.fromJson(json["height"]),
        diameter: json["diameter"] == null ? null : Diameter.fromJson(json["diameter"]),
    );

    Map<String, dynamic> toJson() => {
        "height": height == null ? null : height.toJson(),
        "diameter": diameter == null ? null : diameter.toJson(),
    };
}
