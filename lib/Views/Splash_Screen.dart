import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/Spalsh_Provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SplashState>(context, listen: false).start(context, this);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(
          child: Consumer<SplashState>(
            builder: (context, state, _) {
              final controller = state.animationController;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (controller != null)
                    AnimatedBuilder(
                      animation: controller,
                      builder: (context, _) {
                        return Transform.scale(
                          scale: controller.value + 0.3,
                          child: Image.asset(
                            'assets/icon.png',
                            width: 150,
                            height: 150,
                          ),
                        );
                      },
                    ),
                  Container(
                    height: 100,
                    padding: const EdgeInsets.all(24.0),
                    child: Text(state.showText ? "Europe Countries" : "",
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
