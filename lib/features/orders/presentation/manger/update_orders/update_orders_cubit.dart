import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:meta/meta.dart';

part 'update_orders_state.dart';

class UpdateOrdersCubit extends Cubit<UpdateOrdersState> {
  UpdateOrdersCubit({required this.ordersRepo}) : super(UpdateOrderInitial());

  final OrdersRepo ordersRepo;

  Future<void> updateOrder(
      {required OrderStatusEnum status, required String orderID}) async {
    emit(UpdateOrderLoading());
    final result =
        await ordersRepo.updateOrder(status: status, orderID: orderID);
    result.fold((f) {
      emit(UpdateOrderFailure(f.message));
    }, (r) {
      emit(UpdateOrderSuccess());
    });
  }
}
