library smartsheet.model;

final _id_key = "id";
final _email_key = "email";
final _firstname_key = "firstName";
final _lastname_key = "lastName";

class User {
  int id;
  String firstName;
  String lastName;
  String email;
  User.fromJson(Map json) {
    id = json[_id_key];
    email = json[_email_key];
    firstName = json[_firstname_key];
    lastName = json[_lastname_key];
  }

  Map toJson() => {
        _id_key: id,
        _email_key: email,
        _firstname_key: firstName,
        _lastname_key: lastName
      };
}
