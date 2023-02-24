import 'package:dartz/dartz.dart';
import '../../../../core/base/base_failures.dart';
import '../../../../core/base/use_case.dart';
import '../../data/models/response_model.dart';
import '../repositories/order_repositories.dart';

class GetOrderCase extends UseCase<List<OrderModel>, NoParams> {
  OrderRepository orderRepository;

  GetOrderCase(this.orderRepository);

  @override
  Stream<Either<Failure, List<OrderModel>>> callCase(NoParams params) {
    return orderRepository.getOrders();
  }
}
