import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/order_list_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late OrderCubit _orderCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _orderCubit = BlocProvider.of<OrderCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: Center(child: GetOrderListWidget()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _orderCubit.deleteAllData();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.delete),
      ),
    );
  }
}
