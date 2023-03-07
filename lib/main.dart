import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit_with_tdd/features/orders/injection_container_auth.dart'
    as demoSl;
import 'core/common_strings.dart';
import 'core/sqlite_database/database.dart';
import 'features/native_demo/navtive_demo_widget.dart';
import 'features/orders/presentation/cubit/auth_cubit.dart';
import 'features/orders/presentation/pages/auth_page.dart';

final dbHelper = DatabaseHelper();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await demoSl.init();
  await dbHelper.init();
  runApp(const MyApp());
}

Route<dynamic>? _getRoute(RouteSettings settings) {
  if (settings.name == '/') {
    //Method channel demo
    return _buildRoute(settings, const MethodChannelDemo());
  } else if (settings.name == '/home') {
    return _buildRoute(
        settings,
        BlocProvider(
            create: (_) => demoSl.demoSl<OrderCubit>()..getOrders(),
            child: const MyHomePage()));
  }
  return null;
}

MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
  return MaterialPageRoute(
    settings: settings,
    builder: (ctx) => builder,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: CommonStrings.kAppName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: _getRoute,
    );
  }
}
