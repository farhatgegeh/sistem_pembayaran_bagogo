import '../../presentation/pages/confirm_payment_page.dart';
import '../../presentation/pages/final_scan_page.dart';
import '../../presentation/pages/payment_page.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/initial_scan_page.dart';
import 'component_route.dart';

final router = GoRouter(
  routes: [
    goRoute(
      path: '/home',
      name: 'home',
      child: const HomePage(),
      routes: [
        goRoute(
          path: 'initScan',
          name: 'initScan',
          child: const InitialScanPage(),
        ),
        goRoute(
          path: 'payment',
          name: 'payment',
          child: const PaymentPage(),
        ),
        goRoute(
          path: 'confirm',
          name: 'confirm',
          child: const ConfirmPaymentPage(),
        ),
        GoRoute(
          name: 'finalScan',
          path: 'finalScan/:data',
          pageBuilder: (context, state) {
            String data = state.pathParameters['data'] ?? '';
            return CustomTransitionPage(
              key: state.pageKey,
              arguments: state.extra,
              child: FinalScanPage(data: data),
              transitionsBuilder: transitionsBuilder(),
            );
          },
        ),
      ],
    ),
  ],
  initialLocation: '/home',
  debugLogDiagnostics: true,
  routerNeglect: true,
);
