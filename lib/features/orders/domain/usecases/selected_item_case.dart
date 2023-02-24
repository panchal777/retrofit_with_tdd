import 'package:dartz/dartz.dart';
import '../../../../core/base/base_failures.dart';
import '../../../../core/base/use_case.dart';
import '../../data/models/response_model.dart';
import '../repositories/order_repositories.dart';

class SelectedItemCase extends UseCase<String, SaveItem> {
  OrderRepository orderRepository;

  SelectedItemCase(this.orderRepository);

  @override
  Stream<Either<Failure, String>> callCase(SaveItem params) {
    return orderRepository.saveSelectedItem(params.orderModel);
  }
}

class SaveItem{
  OrderModel orderModel;
  SaveItem(this.orderModel);
}