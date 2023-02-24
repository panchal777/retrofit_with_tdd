import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common.dart';
import '../../../../core/common_strings.dart';
import '../../data/models/response_model.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_cubit_states.dart';

class GetOrderListWidget extends StatelessWidget {
  late List<OrderModel> orderList = [];

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCubit, OrderCubitState>(
      listener: (context, state) {
        if (state is SelectedItemSavedState) {
          Common.showToast(msg: state.msg);
        } else if (state is DeleteAllRecordsState) {
          Common.showToast(msg: state.msg);
        }
      },
      child:
          BlocBuilder<OrderCubit, OrderCubitState>(builder: (context, state) {
        if (state is StateInitial || state is StateLoading) {
          return const CircularProgressIndicator();
        } else if (state is OrderSuccessState) {
          orderList = state.orderList;
        }

        return Container(
            child: orderList.isNotEmpty
                ? ListView.builder(
                    itemCount: orderList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          onTapItem(index, context);
                        },
                        child: Card(
                          margin: const EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                rowValue(CommonStrings.kOrderId,
                                    orderList[index].orderId),
                                const SizedBox(height: 5),
                                rowValue(
                                    CommonStrings.kSeqNo,
                                    Common.isPrime(orderList[index].sequenceNo)
                                        ? '${orderList[index].sequenceNo} (P)'
                                        : '${orderList[index].sequenceNo} (C)'),
                                const SizedBox(height: 5),
                                rowValue(CommonStrings.kOrderType,
                                    orderList[index].orderType),
                                const SizedBox(height: 5),
                                rowValue(
                                    CommonStrings.kExpectedDate,
                                    Common.getDateFormatToString(
                                        orderList[index].expectedDate)),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text(CommonStrings.kNoRecordsFound),
                  ));
      }),
    );
  }

  Widget rowValue(String title, dynamic value) {
    return Row(
      children: [
        Text('$title :'),
        const SizedBox(width: 4),
        Expanded(child: Text(value.toString()))
      ],
    );
  }

  onTapItem(index, context) async {
    //save it to local db
    BlocProvider.of<OrderCubit>(context).saveSelectedItemToDb(orderList[index]);
  }
}
