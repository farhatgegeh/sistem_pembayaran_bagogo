import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/routes/app_routes.dart';
import '../injection.dart' as injection;
import '../presentation/providers/get_distance_location_bloc.dart';
import '../presentation/providers/get_location_bloc.dart';
import '../presentation/providers/qr_code_scanner_bloc.dart';
import '../utils/constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => injection.locator<GetLocationBloc>(),
        ),
        BlocProvider(
          create: (_) => injection.locator<QrCodeScannerBloc>(),
        ),
        BlocProvider(
          create: (_) => injection.locator<GetDistanceBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter App',
        debugShowCheckedModeBanner: false,
        // Theme
        theme: ThemeData.light().copyWith(
          colorScheme: kColorScheme.copyWith(),
        ),
        // Routing
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
