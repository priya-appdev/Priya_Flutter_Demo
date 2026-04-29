class UserState{

  final int? id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final String retypepassword;
  final String country;
  final String state;
  final String city;
  final String streetaddress;
  final String message;

  UserState({
    this.id,
    this.firstName = "",
    this.lastName = "",
    this.email = "",
    this.phone = "",
    this.password = "",
    this.retypepassword = "",
    this.country = "",
    this.state = "",
    this.city = "",
    this.streetaddress = "",
    this.message = ""
  });

  UserState copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? password,
    String? retypepassword,
    String? city,
    String? state,
    String? country,
    String? streetaddress,
    String? message,
  }) {
    return UserState(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      retypepassword: retypepassword ?? this.retypepassword,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      streetaddress: streetaddress ?? this.streetaddress,
      message: message ?? this.message,
    );
  }

  Map<String,dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'firstName' : firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'password': password,
      'retypepassword': retypepassword,
      'country': country,
      'state': state,
      'city': city,
      'streetaddress': streetaddress,
      'message': message
    };
  }

  factory UserState.fromMap(Map<String,dynamic> map){
    return UserState(
      id: map['id'] as int?,
      firstName: map['firstName'] ?? "",
      lastName: map['lastName'] ?? "",
      email: map['email'] ?? "",
      phone: map['phone'] ?? "",
      password: map['password'] ?? "",
      retypepassword: map['retypepassword'] ?? "",
      country: map['country'] ?? "",
      state: map['state'] ?? "",
      city: map['city'] ?? "",
      streetaddress: map['streetaddress'] ?? "",
      message: map['message'] ?? ""

    );

  }




}