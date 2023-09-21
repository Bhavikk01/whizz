enum NestedNavigation {
  homeScreen,
  userProfileScreen,
  appointmentScreen,
  searchHealthcareScreen,
}

extension NestedNavID on NestedNavigation {
  int? get navID {
    switch(this){
      case NestedNavigation.homeScreen:
        return 1;
      case NestedNavigation.searchHealthcareScreen:
        return 2;
      case NestedNavigation.appointmentScreen:
        return 3;
      case NestedNavigation.userProfileScreen:
        return 4;
      default:
        return null;
    }
  }
}