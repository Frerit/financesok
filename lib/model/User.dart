import 'package:financesok/model/Company.dart';
import 'package:financesok/model/Equipo.dart';

class User {

  String id;
  String name;
  String lastname;
  String birhday;
  String email;
  String pass;
  String address;
  String complement;
  String country;
  String departament;
  String city;
  String phone;
  String photoUrl;
  String providerData;
  bool isActive;
  bool isAnonymous;
  bool isNew;
  bool isValidateEmail;
  bool isValidPhone;
  bool isAceptTyC;
  bool isCompleTutorial;
  Company company;
  Equipo equipo;


	User();

	User.fromJsonMap(Map<String, dynamic> map):
		id = map["id"],
		name = map["name"],
		lastname = map["lastname"],
		birhday = map["birhday"],
		email = map["email"],
		pass = map["pass"],
		address = map["address"],
		complement = map["complement"],
		country = map["country"],
		departament = map["departament"],
		city = map["city"],
		phone = map["phone"],
		photoUrl = map["photoUrl"],
		providerData = map["providerData"],
		isActive = map["isActive"],
		isAnonymous = map["isAnonymous"],
		isNew = map["isNew"],
		isValidateEmail = map["isValidateEmail"],
		isValidPhone = map["isValidPhone"],
		isAceptTyC = map["isAceptTyC"],
		isCompleTutorial = map["isCompleTutorial"],
		company = Company.fromJsonMap(map["company"]),
		equipo = Equipo.fromJsonMap(map["equipo"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['name'] = name;
		data['lastname'] = lastname;
		data['birhday'] = birhday;
		data['email'] = email;
		data['pass'] = pass;
		data['address'] = address;
		data['complement'] = complement;
		data['country'] = country;
		data['departament'] = departament;
		data['city'] = city;
		data['phone'] = phone;
		data['photoUrl'] = photoUrl;
		data['providerData'] = providerData;
		data['isActive'] = isActive;
		data['isAnonymous'] = isAnonymous;
		data['isNew'] = isNew;
		data['isValidateEmail'] = isValidateEmail;
		data['isValidPhone'] = isValidPhone;
		data['isAceptTyC'] = isAceptTyC;
		data['isCompleTutorial'] = isCompleTutorial;
		data['company'] = company == null ? null : company.toJson();
		data['equipo'] = equipo == null ? null : equipo.toJson();
		return data;
	}
}
