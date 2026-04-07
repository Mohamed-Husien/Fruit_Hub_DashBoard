import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/order_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});
  static const String routeName = 'order';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Orders',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const OrderViewBody(),
    );
  }
}
