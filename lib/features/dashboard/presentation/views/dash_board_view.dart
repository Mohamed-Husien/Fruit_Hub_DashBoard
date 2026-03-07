import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/dashboard/presentation/views/widgets/dash_board_view_body.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});
  static const String routeName = 'dashboard';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: DashBoardViewBody());
  }
}
