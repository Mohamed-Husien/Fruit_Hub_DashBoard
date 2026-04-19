import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_entity.dart';

import '../../../../../core/enums/order_enum.dart';
import '../../manger/update_orders/update_orders_cubit.dart';

class OrderActionButtons extends StatelessWidget {
  const OrderActionButtons({
    super.key,
    required this.orderEntity,
  });

  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Visibility(
          visible: orderEntity.status == OrderStatusEnum.pending,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrdersCubit>().updateOrder(
                  status: OrderStatusEnum.accepted,
                  orderID: orderEntity.orderID);
            },
            child: const Text('Accept'),
          ),
        ),
        Visibility(
          visible: orderEntity.status == OrderStatusEnum.pending,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Reject'),
          ),
        ),
        Visibility(
          visible: orderEntity.status == OrderStatusEnum.accepted,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrdersCubit>().updateOrder(
                  status: OrderStatusEnum.delivered,
                  orderID: orderEntity.orderID);
            },
            child: const Text('Delivered'),
          ),
        ),
      ],
    );
  }
}
