import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/add_product/presenatation/views/add_product_view.dart';
import 'package:fruit_hub_dashboard/features/dashboard/presentation/views/dash_board_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashBoardView.routeName:
      return MaterialPageRoute(
        builder: (context) => const DashBoardView(),
      );
    case AddProductView.routeName:
      return MaterialPageRoute(
        builder: (context) => const AddProductView(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('No route defined for this path'),
          ),
        ),
      );
  }
}
