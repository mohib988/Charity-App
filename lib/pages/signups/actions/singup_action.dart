import 'package:flutter_application_1/models/org.dart';

Function(dynamic value)? getOnChangedFunction(
    OrganizationInfo organization, String type) {
  final fieldMap = {
    'name': (value) => organization.name = value,
    'address': (value) => organization.address = value,
    'country': (value) => organization.country = value,
    'mission': (value) => organization.mission = value,
    'description': (value) => organization.description = value,
  };
  return fieldMap[type];
}
