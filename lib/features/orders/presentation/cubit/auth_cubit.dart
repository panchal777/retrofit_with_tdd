import '../../../../core/base/use_case.dart';
import '../../../../main.dart';
import '../../data/models/response_model.dart';
import '../../domain/usecases/get_orders_case.dart';
import '../../domain/usecases/selected_item_case.dart';
import 'auth_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<OrderCubitState> {
  GetOrderCase? orderCase;
  SelectedItemCase? selectedItemCase;

  OrderCubit({this.orderCase, this.selectedItemCase}) : super(StateInitial());

  getOrders() {
    orderCase!.callCase(NoParams()).listen((data) {
      data.fold((onError) {
        emit(OrderErrorState(onError.toString()));
      }, (list) {
        emit(OrderSuccessState(orderList: list, msg: 'List fetched'));
      });
    });
  }

  saveSelectedItemToDb(OrderModel orderModel) async {
    // row to insert
    selectedItemCase!.callCase(SaveItem(orderModel)).listen((data) {
      data.fold((onError) {
        emit(OrderErrorState(onError.toString()));
      }, (id) {
        emit(SelectedItemSavedState(msg: 'Data saved for order Id $id'));
      });
    });
  }

  deleteAllData() async {
    var getData = await dbHelper.queryAllRows();
    if (getData.isNotEmpty) {
      await dbHelper.deleteAll();
      emit(const DeleteAllRecordsState(
          msg: 'All records deleted successfully from database'));
    } else {
      emit(const DeleteAllRecordsState(msg: 'No records found to delete'));
    }
  }
}
