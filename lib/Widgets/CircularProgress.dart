import 'package:flutter/material.dart';

import '../Theme/Colors.dart';

Container circularProgress() {
  return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 10.0),
      child: const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(appBarColor),
      ));
}

Container linearProgress() {
  return Container(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: const LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(appBarColor),
      backgroundColor: Colors.white,
    ),
  );
}
