import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FruitDashBoard());
}

class FruitDashBoard extends StatelessWidget {
  const FruitDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Hub Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Scaffold(
        body: Center(
          child: Text('Welcome to Fruit Hub Dashboard!'),
        ),
      ),
    );
  }
}
