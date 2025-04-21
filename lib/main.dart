import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/onboarding_screen.dart';
import 'providers/onboarding_provider.dart';
import 'providers/auth/auth_provider.dart';
import 'screens/auth/auth_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const LankaSwapApp());
}

class LankaSwapApp extends StatelessWidget {
  const LankaSwapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()..init()),
      ],
      child: MaterialApp(
        title: 'LankaSwap',
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        home: AuthWrapper(child: const OnboardingScreen()),
      ),
    );
  }
}
