part of 'update_orders_cubit.dart';

@immutable
sealed class UpdateOrdersState {}

final class UpdateOrderInitial extends UpdateOrdersState {}

final class UpdateOrderLoading extends UpdateOrdersState {}

final class UpdateOrderFailure extends UpdateOrdersState {
  final String errMessage;

  UpdateOrderFailure(this.errMessage);
}

final class UpdateOrderSuccess extends UpdateOrdersState {}
