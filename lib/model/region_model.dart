class RegionModel {
  List<String> regions;

  RegionModel({this.regions});

  RegionModel.fromJson(Map<String, dynamic> json) {
    regions = json['regions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['regions'] = this.regions;
    return data;
  }
}
