import '../models/response_model.dart';

abstract class OrderLocalSrc {
  Future<List<OrderModel>> getOrders();

  Future<String>saveSelectedItem(OrderModel orderModel);
}
