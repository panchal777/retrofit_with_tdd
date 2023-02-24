import 'package:equatable/equatable.dart';

import '../../data/models/response_model.dart';

abstract class OrderCubitState extends Equatable {
  const OrderCubitState();
}

class StateInitial extends OrderCubitState {
  @override
  List<Object?> get props => [];
}

class StateLoading extends OrderCubitState {
  @override
  List<Object?> get props => [];
}

class OrderSuccessState extends OrderCubitState {
  final String msg;
  final List<OrderModel> orderList;

  @override
  List<Object?> get props => [msg, orderList];

  const OrderSuccessState({required this.msg, required this.orderList});
}

class SelectedItemSavedState extends OrderCubitState {
  final String msg;

  @override
  List<Object?> get props => [msg];

  const SelectedItemSavedState({required this.msg});
}

class DeleteAllRecordsState extends OrderCubitState {
  final String msg;

  @override
  List<Object?> get props => [msg];

  const DeleteAllRecordsState({required this.msg});
}

class OrderErrorState extends OrderCubitState {
  final String msg;

  @override
  List<Object?> get props => [msg];

  const OrderErrorState(this.msg);
}
