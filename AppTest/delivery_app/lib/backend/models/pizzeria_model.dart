import 'package:delivery_app/backend/repositories/ids/concatened_id.dart';
import 'package:delivery_app/utils/address.dart';
import 'package:delivery_app/utils/email.dart';
import 'package:delivery_app/utils/openning_hours.dart';
import 'package:delivery_app/utils/phone.dart';

class Pizzeria {
  ConcatenatedID id;
  String name;
  Email email;
  Phone phone;
  Address address;
  OpenningHours openningHours;

  Pizzeria({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.openningHours,
  });
}
