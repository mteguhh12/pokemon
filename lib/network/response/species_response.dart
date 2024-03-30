class SpeciesResponse {
  DataIsi? color;
  List<DataIsi>? eggGroups;
  DataIsi? generation;
  DataIsi? growthRate;
  DataIsi? habitat;
  int? id;
  String? name;

  SpeciesResponse(
      {this.color,
      this.eggGroups,
      this.generation,
      this.growthRate,
      this.habitat,
      this.id,
      this.name});

  SpeciesResponse.fromJson(Map<String, dynamic> json) {
    color = json['color'] != null ? new DataIsi.fromJson(json['color']) : null;
    if (json['egg_groups'] != null) {
      eggGroups = <DataIsi>[];
      json['egg_groups'].forEach((v) {
        eggGroups!.add(new DataIsi.fromJson(v));
      });
    }
    generation = json['generation'] != null
        ? new DataIsi.fromJson(json['generation'])
        : null;
    growthRate = json['growth_rate'] != null
        ? new DataIsi.fromJson(json['growth_rate'])
        : null;
    habitat =
        json['habitat'] != null ? new DataIsi.fromJson(json['habitat']) : null;
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.color != null) {
      data['color'] = this.color!.toJson();
    }
    if (this.eggGroups != null) {
      data['egg_groups'] = this.eggGroups!.map((v) => v.toJson()).toList();
    }
    if (this.generation != null) {
      data['generation'] = this.generation!.toJson();
    }
    if (this.growthRate != null) {
      data['growth_rate'] = this.growthRate!.toJson();
    }
    if (this.habitat != null) {
      data['habitat'] = this.habitat!.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class DataIsi {
  String? name;
  String? url;

  DataIsi({this.name, this.url});

  DataIsi.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
