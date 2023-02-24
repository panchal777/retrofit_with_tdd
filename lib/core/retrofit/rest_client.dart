import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../features/orders/data/models/response_model.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: '')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/get-orders-v3.json")
  Future<ResponseModel> fetchOrders(@Body() Map<String, dynamic> data);
}
