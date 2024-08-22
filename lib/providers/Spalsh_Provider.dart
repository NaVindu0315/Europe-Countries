import 'package:flutter/material.dart';

import '../Views/Dashboard.dart';

class SplashState extends ChangeNotifier {
  AnimationController? animationController;
  bool showText = false;

  void start(BuildContext context, TickerProvider ticker) {
    animationController = AnimationController(
      vsync: ticker,
      duration: const Duration(seconds: 3),
    );

    animationController!.forward().whenComplete(() {
      showText = true;
      notifyListeners();

      debugPrint('Splash Completed');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Dashboard(),
        ),
      );
    });
    notifyListeners();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }
}
