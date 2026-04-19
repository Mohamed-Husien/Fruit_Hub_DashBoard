import 'package:fruit_hub_dashboard/features/orders/data/models/shipping_address_model.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_entity.dart';

import '../../../../core/enums/order_enum.dart';
import 'order_product_model.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String? status;
  final String orderID;
  OrderModel(
      {required this.totalPrice,
      required this.uId,
      required this.status,
      required this.orderID,
      required this.shippingAddressModel,
      required this.orderProducts,
      required this.paymentMethod});

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        totalPrice: (json['totalPrice'] ?? 0.0).toDouble(), // تأمين تحويل الرقم
        uId: json['uId'] ?? '', // إذا كان null اجعله نصاً فارغاً
        status: json['status'] ?? 'pending',
        orderID:
            json['orderId'] ?? json['orderID'] ?? '', // جرب الاحتمالين للاسم
        shippingAddressModel:
            ShippingAddressModel.fromJson(json['shippingAddressModel'] ?? {}),
        orderProducts: json['orderProducts'] != null
            ? List<OrderProductModel>.from(
                json['orderProducts'].map((e) => OrderProductModel.fromJson(e)))
            : [], // إذا كانت القائمة null اجعلها قائمة فارغة
        paymentMethod: json['paymentMethod'] ?? 'Cash',
      );
  toJson() => {
        'totalPrice': totalPrice,
        'uId': uId,
        'status': 'pending',
        'date': DateTime.now().toString(),
        'shippingAddressModel': shippingAddressModel.toJson(),
        'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
        'paymentMethod': paymentMethod,
      };

  toEntity() => OrderEntity(
        orderID: orderID,
        totalPrice: totalPrice,
        status: fetchEnum(),
        uId: uId,
        shippingAddressModel: shippingAddressModel.toEntity(),
        orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
        paymentMethod: paymentMethod,
      );

  OrderStatusEnum fetchEnum() {
    return OrderStatusEnum.values.firstWhere((e) {
      var enumStatus = e.name.toString();
      return enumStatus == (status ?? 'pending');
    });
  }
}

// payment method
