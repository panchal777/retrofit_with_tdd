import 'package:get_it/get_it.dart';
import 'package:retrofit_with_tdd/features/orders/presentation/cubit/auth_cubit.dart';
import 'data/datasource/orders_local_src.dart';
import 'data/datasource/orders_local_src_impl.dart';
import 'data/repositories/order_repositories_impl.dart';
import 'domain/repositories/order_repositories.dart';
import 'domain/usecases/get_orders_case.dart';
import 'domain/usecases/selected_item_case.dart';

final demoSl = GetIt.instance;

Future<void> init() async {
  /*
  * Members
  * */
  demoSl.registerFactory(
    () => OrderCubit(orderCase: demoSl(), selectedItemCase: demoSl()),
  );

  // Use Cases
  demoSl.registerLazySingleton(() => GetOrderCase(demoSl()));
  demoSl.registerLazySingleton(() => SelectedItemCase(demoSl()));

  // Repository
  demoSl.registerLazySingleton<OrderRepository>(
      () => OrderRepositoryImpl(demoSl()));

  // Data sources
  demoSl.registerLazySingleton<OrderLocalSrc>(
    () => OrderLocalSrcImpl(),
  );
}
