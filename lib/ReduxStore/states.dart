import "dart:io";

import "../models/org.dart";

class AppState {
  final OrganizationInfo organization;

  AppState({
    required this.organization,
  });

  factory AppState.initialState() => AppState(
        organization: OrganizationInfo(image: File("")),
      );
}
