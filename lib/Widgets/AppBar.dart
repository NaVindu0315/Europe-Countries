import 'package:flutter/material.dart';

import '../Theme/Colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Europe Countries',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.blue[200],
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.map,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
