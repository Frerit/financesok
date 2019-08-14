
class Equipo {

  String name;
  String baseOS;
  String model;
  String version;

	Equipo.fromJsonMap(Map<String, dynamic> map): 
		name = map["name"],
		baseOS = map["baseOS"],
		model = map["model"],
		version = map["version"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = name;
		data['baseOS'] = baseOS;
		data['model'] = model;
		data['version'] = version;
		return data;
	}
}
