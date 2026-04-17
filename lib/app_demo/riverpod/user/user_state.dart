class UserState{

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
}