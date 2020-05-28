// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  List<People> results;
  Info info;

  Data({
    this.results,
    this.info,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    results: List<People>.from(json["results"].map((x) => People.fromJson(x))),
    info: Info.fromJson(json["info"]),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "info": info.toJson(),
  };
}

class Info {
  String seed;
  int results;
  int page;
  String version;

  Info({
    this.seed,
    this.results,
    this.page,
    this.version,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    seed: json["seed"],
    results: json["results"],
    page: json["page"],
    version: json["version"],
  );

  Map<String, dynamic> toJson() => {
    "seed": seed,
    "results": results,
    "page": page,
    "version": version,
  };
}

class People {
  String gender;
  Name name;
  Location location;
  String email;
  Login login;
  String dob;
  String registered;
  String phone;
  String cell;
  Id id;
  Picture picture;
  String nat;

  People({
    this.gender,
    this.name,
    this.location,
    this.email,
    this.login,
    this.dob,
    this.registered,
    this.phone,
    this.cell,
    this.id,
    this.picture,
    this.nat,
  });

  factory People.fromJson(Map<String, dynamic> json) => People(
    gender: json["gender"],
    name: Name.fromJson(json["name"]),
    location: Location.fromJson(json["location"]),
    email: json["email"],
    login: Login.fromJson(json["login"]),
    dob: json["dob"],
    registered: json["registered"],
    phone: json["phone"],
    cell: json["cell"],
    id: Id.fromJson(json["id"]),
    picture: Picture.fromJson(json["picture"]),
    nat: json["nat"],
  );

  Map<String, dynamic> toJson() => {
    "gender": gender,
    "name": name.toJson(),
    "location": location.toJson(),
    "email": email,
    "login": login.toJson(),
    "dob": dob,
    "registered": registered,
    "phone": phone,
    "cell": cell,
    "id": id.toJson(),
    "picture": picture.toJson(),
    "nat": nat,
  };
}

class Id {
  String name;
  String value;

  Id({
    this.name,
    this.value,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    name: json["name"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "value": value,
  };
}

class Location {
  String street;
  String city;
  String state;
  int postcode;

  Location({
    this.street,
    this.city,
    this.state,
    this.postcode,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    street: json["street"],
    city: json["city"],
    state: json["state"],
    postcode: json["postcode"],
  );

  Map<String, dynamic> toJson() => {
    "street": street,
    "city": city,
    "state": state,
    "postcode": postcode,
  };
}

class Login {
  String username;
  String password;
  String salt;
  String md5;
  String sha1;
  String sha256;

  Login({
    this.username,
    this.password,
    this.salt,
    this.md5,
    this.sha1,
    this.sha256,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    username: json["username"],
    password: json["password"],
    salt: json["salt"],
    md5: json["md5"],
    sha1: json["sha1"],
    sha256: json["sha256"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "salt": salt,
    "md5": md5,
    "sha1": sha1,
    "sha256": sha256,
  };
}

class Name {
  String title;
  String first;
  String last;

  Name({
    this.title,
    this.first,
    this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    title: json["title"],
    first: json["first"],
    last: json["last"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "first": first,
    "last": last,
  };
}

class Picture {
  String large;
  String medium;
  String thumbnail;

  Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
    large: json["large"],
    medium: json["medium"],
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "large": large,
    "medium": medium,
    "thumbnail": thumbnail,
  };
}
