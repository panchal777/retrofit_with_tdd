import 'package:dartz/dartz.dart';
import '../../../../core/base/base_failures.dart';
import '../../domain/repositories/order_repositories.dart';
import '../datasource/orders_local_src.dart';
import '../models/response_model.dart';

class OrderRepositoryImpl extends OrderRepository {
  OrderLocalSrc orderLocalSrc;

  OrderRepositoryImpl(this.orderLocalSrc);

  @override
  Stream<Either<Failure, List<OrderModel>>> getOrders() async* {
    try {
      var response = await orderLocalSrc.getOrders();
      yield Right(response);
    } catch (e, s) {
      Failure error = await checkErrorState(e, s);
      yield Left(error);
    }
  }

  Future<Failure> checkErrorState(e, StackTrace s) async {
    return FailureMessage(e.toString());
  }

  @override
  Stream<Either<Failure, String>> saveSelectedItem(
      OrderModel orderModel) async* {
    try {
      var response = await orderLocalSrc.saveSelectedItem(orderModel);
      yield Right(response);
    } catch (e, s) {
      Failure error = await checkErrorState(e, s);
      yield Left(error);
    }
  }
}
