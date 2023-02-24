import 'package:flutter/cupertino.dart';
import '../../../../core/retrofit/rest_client.dart';
import '../../../../core/sqlite_database/database.dart';
import '../../../../main.dart';
import '../models/response_model.dart';
import 'orders_local_src.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class OrderLocalSrcImpl extends OrderLocalSrc {
  late RestClient restClient;

  @override
  Future<List<OrderModel>> getOrders() async {
    var response = await getOrderListApi().single;
    return response.data.orderInfo.orders;
  }

  Future initRestClient({bool refreshToken = false}) async {
    Dio dio = Dio();
    dio.options.headers['content-type'] = 'application/json';
    dio.interceptors.add(LogInterceptor(responseBody: true));
    restClient = (RestClient(dio));
  }

  Stream<ResponseModel> getOrderListApi() {
    return Stream.fromFuture(initRestClient()).flatMap((data) {
      Map<String, dynamic> map = {};
      map["restaurant_id"] = "88";
      map["status"] = 4;
      map['page'] = 1;

      return RetryWhenStream(
          () => Stream.fromFuture(restClient.fetchOrders(map)), (e, s) async* {
        yield* Stream.error(e);
      });
    });
  }

  @override
  Future<String> saveSelectedItem(OrderModel orderModel) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: orderModel.orderId.toString(),
      DatabaseHelper.columnOrderId: orderModel.orderId.toString(),
      DatabaseHelper.columnSeqNo: orderModel.sequenceNo.toString(),
      DatabaseHelper.columnOrderType: orderModel.orderType.toString(),
      DatabaseHelper.columnExpectedDate: orderModel.expectedDate.toString(),
    };
    final id = await dbHelper.insert(row);
    debugPrint('inserted row id: $id  :: ${orderModel.orderId.toString()}');
    var getData = await dbHelper.queryAllRows();
    debugPrint('total inserted rows : ${getData.length}');
    return id.toString();
  }
}
