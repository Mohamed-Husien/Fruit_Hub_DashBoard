import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/filter_section.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [FilterSection()],
      ),
    );
  }
}
