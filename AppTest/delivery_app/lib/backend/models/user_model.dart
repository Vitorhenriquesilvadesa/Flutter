import 'package:delivery_app/backend/repositories/generic/generic_entity.dart';
import 'package:delivery_app/backend/repositories/ids/int_id.dart';
import 'package:delivery_app/utils/address.dart';
import 'package:delivery_app/utils/email.dart';
import 'package:delivery_app/utils/password.dart';
import 'package:delivery_app/utils/phone.dart';

class User extends GenericEntity {
  String name;
  Email email;
  Phone phone;
  Address address;
  Password password;

  User({
    required super.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.password,
  });

  User.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        email = Email(
            username: map['email_username'], domainName: map['email_domain']),
        phone = Phone(
          countryCode: map['phone_country_code'],
          areaCode: map['phone_area_code'],
          localNumber: map['phone_local_number'],
        ),
        address = Address(
          street: map['address_street'],
          number: map['address_number'],
          complement: map['address_complement'],
          neighborhood: map['address_neighborhood'],
          city: map['address_city'],
          zipCode: map['address_zip_code'],
        ),
        password = Password(map['password']),
        super.fromId(
          IntID(map["id"]),
        );

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id.value,
      'name': name,
      'email_username': email.username,
      'email_domain': email.domainName,
      'phone_country_code': phone.countryCode,
      'phone_area_code': phone.areaCode,
      'phone_local_number': phone.localNumber,
      'address_street': address.street,
      'address_number': address.number,
      'address_complement': address.complement,
      'address_neighborhood': address.neighborhood,
      'address_city': address.city,
      'address_zip_code': address.zipCode,
      'password': password.encryptedPassword,
    };
  }
}

List<User> users = [];
