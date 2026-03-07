import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/helper_fun/on_generate_route.dart';
import 'package:fruit_hub_dashboard/features/dashboard/presentation/views/dash_board_view.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashBoardView.routeName,
    );
  }
}
