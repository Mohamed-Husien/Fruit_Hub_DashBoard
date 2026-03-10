import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/helper_fun/on_generate_route.dart';
import 'package:fruit_hub_dashboard/core/services/custom_bloc_observer.dart';
import 'package:fruit_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruit_hub_dashboard/features/dashboard/presentation/views/dash_board_view.dart';
import 'package:fruit_hub_dashboard/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  setupGetit();
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://mzbywmzboxahxuqbvsja.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im16Ynl3bXpib3hhaHh1cWJ2c2phIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzMwMjQ4OTgsImV4cCI6MjA4ODYwMDg5OH0.pJSNtp2kVoTb2Lp6NqQ4jf_kP22zwcHyBKZfgYWY6Z8',
  );
  Bloc.observer = CustomBlocObserver();
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
