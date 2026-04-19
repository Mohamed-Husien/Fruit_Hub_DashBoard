import 'package:flutter/widgets.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_entity.dart';

import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/order_item_widget.dart';

class OrdersItemsListView extends StatelessWidget {
  const OrdersItemsListView({super.key, required this.orderModels});

  final List<OrderEntity> orderModels;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderModels.length,
      itemBuilder: (context, index) {
        return OrderItemWidget(orderModel: orderModels[index]);
      },
    );
  }
}
