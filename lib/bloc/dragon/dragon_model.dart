// To parse this JSON data, do
//
//     final dragonModel = dragonModelFromJson(jsonString);

import 'dart:convert';

class DragonModel {
    DragonModel({
        this.id,
        this.name,
        this.type,
        this.active,
        this.crewCapacity,
        this.sidewallAngleDeg,
        this.orbitDurationYr,
        this.dryMassKg,
        this.dryMassLb,
        this.firstFlight,
        this.heatShield,
        this.thrusters,
        this.launchPayloadMass,
        this.launchPayloadVol,
        this.returnPayloadMass,
        this.returnPayloadVol,
        this.pressurizedCapsule,
        this.trunk,
        this.heightWTrunk,
        this.diameter,
        this.flickrImages,
        this.wikipedia,
        this.description,
    });

    String id;
    String name;
    String type;
    bool active;
    int crewCapacity;
    int sidewallAngleDeg;
    int orbitDurationYr;
    int dryMassKg;
    int dryMassLb;
    DateTime firstFlight;
    HeatShield heatShield;
    List<Thruster> thrusters;
    PayloadMass launchPayloadMass;
    LaunchPayloadVol launchPayloadVol;
    PayloadMass returnPayloadMass;
    LaunchPayloadVol returnPayloadVol;
    PressurizedCapsule pressurizedCapsule;
    Trunk trunk;
    Diameter heightWTrunk;
    Diameter diameter;
    List<String> flickrImages;
    String wikipedia;
    String description;

    factory DragonModel.fromRawJson(String str) => DragonModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DragonModel.fromJson(Map<String, dynamic> json) => DragonModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        active: json["active"] == null ? null : json["active"],
        crewCapacity: json["crew_capacity"] == null ? null : json["crew_capacity"],
        sidewallAngleDeg: json["sidewall_angle_deg"] == null ? null : json["sidewall_angle_deg"],
        orbitDurationYr: json["orbit_duration_yr"] == null ? null : json["orbit_duration_yr"],
        dryMassKg: json["dry_mass_kg"] == null ? null : json["dry_mass_kg"],
        dryMassLb: json["dry_mass_lb"] == null ? null : json["dry_mass_lb"],
        firstFlight: json["first_flight"] == null ? null : DateTime.parse(json["first_flight"]),
        heatShield: json["heat_shield"] == null ? null : HeatShield.fromJson(json["heat_shield"]),
        thrusters: json["thrusters"] == null ? null : List<Thruster>.from(json["thrusters"].map((x) => Thruster.fromJson(x))),
        launchPayloadMass: json["launch_payload_mass"] == null ? null : PayloadMass.fromJson(json["launch_payload_mass"]),
        launchPayloadVol: json["launch_payload_vol"] == null ? null : LaunchPayloadVol.fromJson(json["launch_payload_vol"]),
        returnPayloadMass: json["return_payload_mass"] == null ? null : PayloadMass.fromJson(json["return_payload_mass"]),
        returnPayloadVol: json["return_payload_vol"] == null ? null : LaunchPayloadVol.fromJson(json["return_payload_vol"]),
        pressurizedCapsule: json["pressurized_capsule"] == null ? null : PressurizedCapsule.fromJson(json["pressurized_capsule"]),
        trunk: json["trunk"] == null ? null : Trunk.fromJson(json["trunk"]),
        heightWTrunk: json["height_w_trunk"] == null ? null : Diameter.fromJson(json["height_w_trunk"]),
        diameter: json["diameter"] == null ? null : Diameter.fromJson(json["diameter"]),
        flickrImages: json["flickr_images"] == null ? null : List<String>.from(json["flickr_images"].map((x) => x)),
        wikipedia: json["wikipedia"] == null ? null : json["wikipedia"],
        description: json["description"] == null ? null : json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "type": type == null ? null : type,
        "active": active == null ? null : active,
        "crew_capacity": crewCapacity == null ? null : crewCapacity,
        "sidewall_angle_deg": sidewallAngleDeg == null ? null : sidewallAngleDeg,
        "orbit_duration_yr": orbitDurationYr == null ? null : orbitDurationYr,
        "dry_mass_kg": dryMassKg == null ? null : dryMassKg,
        "dry_mass_lb": dryMassLb == null ? null : dryMassLb,
        "first_flight": firstFlight == null ? null : "${firstFlight.year.toString().padLeft(4, '0')}-${firstFlight.month.toString().padLeft(2, '0')}-${firstFlight.day.toString().padLeft(2, '0')}",
        "heat_shield": heatShield == null ? null : heatShield.toJson(),
        "thrusters": thrusters == null ? null : List<dynamic>.from(thrusters.map((x) => x.toJson())),
        "launch_payload_mass": launchPayloadMass == null ? null : launchPayloadMass.toJson(),
        "launch_payload_vol": launchPayloadVol == null ? null : launchPayloadVol.toJson(),
        "return_payload_mass": returnPayloadMass == null ? null : returnPayloadMass.toJson(),
        "return_payload_vol": returnPayloadVol == null ? null : returnPayloadVol.toJson(),
        "pressurized_capsule": pressurizedCapsule == null ? null : pressurizedCapsule.toJson(),
        "trunk": trunk == null ? null : trunk.toJson(),
        "height_w_trunk": heightWTrunk == null ? null : heightWTrunk.toJson(),
        "diameter": diameter == null ? null : diameter.toJson(),
        "flickr_images": flickrImages == null ? null : List<dynamic>.from(flickrImages.map((x) => x)),
        "wikipedia": wikipedia == null ? null : wikipedia,
        "description": description == null ? null : description,
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

class HeatShield {
    HeatShield({
        this.material,
        this.sizeMeters,
        this.tempDegrees,
        this.devPartner,
    });

    String material;
    double sizeMeters;
    int tempDegrees;
    String devPartner;

    factory HeatShield.fromRawJson(String str) => HeatShield.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HeatShield.fromJson(Map<String, dynamic> json) => HeatShield(
        material: json["material"] == null ? null : json["material"],
        sizeMeters: json["size_meters"] == null ? null : json["size_meters"].toDouble(),
        tempDegrees: json["temp_degrees"] == null ? null : json["temp_degrees"],
        devPartner: json["dev_partner"] == null ? null : json["dev_partner"],
    );

    Map<String, dynamic> toJson() => {
        "material": material == null ? null : material,
        "size_meters": sizeMeters == null ? null : sizeMeters,
        "temp_degrees": tempDegrees == null ? null : tempDegrees,
        "dev_partner": devPartner == null ? null : devPartner,
    };
}

class PayloadMass {
    PayloadMass({
        this.kg,
        this.lb,
    });

    int kg;
    int lb;

    factory PayloadMass.fromRawJson(String str) => PayloadMass.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PayloadMass.fromJson(Map<String, dynamic> json) => PayloadMass(
        kg: json["kg"] == null ? null : json["kg"],
        lb: json["lb"] == null ? null : json["lb"],
    );

    Map<String, dynamic> toJson() => {
        "kg": kg == null ? null : kg,
        "lb": lb == null ? null : lb,
    };
}

class LaunchPayloadVol {
    LaunchPayloadVol({
        this.cubicMeters,
        this.cubicFeet,
    });

    int cubicMeters;
    int cubicFeet;

    factory LaunchPayloadVol.fromRawJson(String str) => LaunchPayloadVol.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LaunchPayloadVol.fromJson(Map<String, dynamic> json) => LaunchPayloadVol(
        cubicMeters: json["cubic_meters"] == null ? null : json["cubic_meters"],
        cubicFeet: json["cubic_feet"] == null ? null : json["cubic_feet"],
    );

    Map<String, dynamic> toJson() => {
        "cubic_meters": cubicMeters == null ? null : cubicMeters,
        "cubic_feet": cubicFeet == null ? null : cubicFeet,
    };
}

class PressurizedCapsule {
    PressurizedCapsule({
        this.payloadVolume,
    });

    LaunchPayloadVol payloadVolume;

    factory PressurizedCapsule.fromRawJson(String str) => PressurizedCapsule.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PressurizedCapsule.fromJson(Map<String, dynamic> json) => PressurizedCapsule(
        payloadVolume: json["payload_volume"] == null ? null : LaunchPayloadVol.fromJson(json["payload_volume"]),
    );

    Map<String, dynamic> toJson() => {
        "payload_volume": payloadVolume == null ? null : payloadVolume.toJson(),
    };
}

class Thruster {
    Thruster({
        this.type,
        this.amount,
        this.pods,
        this.fuel1,
        this.fuel2,
        this.isp,
        this.thrust,
    });

    String type;
    int amount;
    int pods;
    String fuel1;
    String fuel2;
    int isp;
    Thrust thrust;

    factory Thruster.fromRawJson(String str) => Thruster.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Thruster.fromJson(Map<String, dynamic> json) => Thruster(
        type: json["type"] == null ? null : json["type"],
        amount: json["amount"] == null ? null : json["amount"],
        pods: json["pods"] == null ? null : json["pods"],
        fuel1: json["fuel_1"] == null ? null : json["fuel_1"],
        fuel2: json["fuel_2"] == null ? null : json["fuel_2"],
        isp: json["isp"] == null ? null : json["isp"],
        thrust: json["thrust"] == null ? null : Thrust.fromJson(json["thrust"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "amount": amount == null ? null : amount,
        "pods": pods == null ? null : pods,
        "fuel_1": fuel1 == null ? null : fuel1,
        "fuel_2": fuel2 == null ? null : fuel2,
        "isp": isp == null ? null : isp,
        "thrust": thrust == null ? null : thrust.toJson(),
    };
}

class Thrust {
    Thrust({
        this.kN,
        this.lbf,
    });

    double kN;
    int lbf;

    factory Thrust.fromRawJson(String str) => Thrust.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Thrust.fromJson(Map<String, dynamic> json) => Thrust(
        kN: json["kN"] == null ? null : json["kN"].toDouble(),
        lbf: json["lbf"] == null ? null : json["lbf"],
    );

    Map<String, dynamic> toJson() => {
        "kN": kN == null ? null : kN,
        "lbf": lbf == null ? null : lbf,
    };
}

class Trunk {
    Trunk({
        this.trunkVolume,
        this.cargo,
    });

    LaunchPayloadVol trunkVolume;
    Cargo cargo;

    factory Trunk.fromRawJson(String str) => Trunk.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Trunk.fromJson(Map<String, dynamic> json) => Trunk(
        trunkVolume: json["trunk_volume"] == null ? null : LaunchPayloadVol.fromJson(json["trunk_volume"]),
        cargo: json["cargo"] == null ? null : Cargo.fromJson(json["cargo"]),
    );

    Map<String, dynamic> toJson() => {
        "trunk_volume": trunkVolume == null ? null : trunkVolume.toJson(),
        "cargo": cargo == null ? null : cargo.toJson(),
    };
}

class Cargo {
    Cargo({
        this.solarArray,
        this.unpressurizedCargo,
    });

    int solarArray;
    bool unpressurizedCargo;

    factory Cargo.fromRawJson(String str) => Cargo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Cargo.fromJson(Map<String, dynamic> json) => Cargo(
        solarArray: json["solar_array"] == null ? null : json["solar_array"],
        unpressurizedCargo: json["unpressurized_cargo"] == null ? null : json["unpressurized_cargo"],
    );

    Map<String, dynamic> toJson() => {
        "solar_array": solarArray == null ? null : solarArray,
        "unpressurized_cargo": unpressurizedCargo == null ? null : unpressurizedCargo,
    };
}
