
class Company {

  String name;
  String id;
  String location;

	Company.fromJsonMap(Map<String, dynamic> map): 
		name = map["name"],
		id = map["id"],
		location = map["location"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = name;
		data['id'] = id;
		data['location'] = location;
		return data;
	}
}
