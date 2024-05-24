import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void changeWebPageTitle_(String title) {
  SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
    label: title,
    primaryColor: kDefaultIconLightColor.value,
  ));
}