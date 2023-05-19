import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../utils/constants.dart';
import 'package:flutter/material.dart';

import '../../config/routes/app_routes.dart';
import '../../config/theme/themes.dart';
import '../providers/get_distance_location_bloc.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget buildAppBar() => AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kGreen,
          title: Text("Pembayaran", style: kHeading6),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              router.goNamed('home');
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kWhite,
            ),
          ),
        );

    Widget buildBodyApp() => BlocBuilder<GetDistanceBloc, GetDistanceState>(
          builder: (context, state) {
            if (state is DistanceLoadedState) {
              return Padding(
                padding: const EdgeInsets.only(left: 20, top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'TOTAL PEMBAYARAN',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: 'id',
                        symbol: 'Rp. ',
                        decimalDigits: 0,
                      ).format(state.total),
                      style: kHeading2,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: Text("Something when wrong", style: kHeading6),
            );
          },
        );

    Widget buildButtonAppBar() => BottomAppBar(
          child: Container(
            height: 160,
            padding: const EdgeInsets.all(20),
            color: Colors.grey.shade200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                      child: Image.asset('assets/ride.png'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Flexible(
                      child: Text(
                          'Seluruh transaksi kamu cepat dan aman. Dengan melanjutkan proses ini, kamu menyetujui'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xff008821),
                      ),
                    ),
                    onPressed: () {
                      router.goNamed('confirm');
                    },
                    child: const Center(
                      child: Text('KONFIRMASI PEMBAYARAN'),
                    ),
                  ),
                )
              ],
            ),
          ),
        );

    return Scaffold(
      appBar: buildAppBar(),
      body: buildBodyApp(),
      bottomNavigationBar: buildButtonAppBar(),
    );
  }
}
