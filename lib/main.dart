import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/onboarding_screen.dart';
import 'providers/onboarding_provider.dart';

void main() {
  runApp(const LankaSwapApp());
}

class LankaSwapApp extends StatelessWidget {
  const LankaSwapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => OnboardingProvider())],
      child: MaterialApp(
        title: 'LankaSwap',
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        home: const OnboardingScreen(),
      ),
    );
  }
}
