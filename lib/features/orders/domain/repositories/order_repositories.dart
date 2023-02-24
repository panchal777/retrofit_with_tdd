import 'package:dartz/dartz.dart';
import '../../../../core/base/base_failures.dart';
import '../../data/models/response_model.dart';

abstract class OrderRepository {
  Stream<Either<Failure, List<OrderModel>>> getOrders();

  Stream<Either<Failure, String>> saveSelectedItem(OrderModel orderModel);
}
