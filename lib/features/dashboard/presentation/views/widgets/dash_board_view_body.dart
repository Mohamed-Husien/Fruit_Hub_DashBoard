import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';

class DashBoardViewBody extends StatelessWidget {
  const DashBoardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CustomButton(onPressed: () {}, text: 'add data ')],
        ),
      ),
    );
  }
}
