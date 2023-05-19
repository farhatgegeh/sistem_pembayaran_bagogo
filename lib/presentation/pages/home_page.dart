import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes/app_routes.dart';
import '../../config/theme/themes.dart';
import '../../utils/constants.dart';
import '../providers/qr_code_scanner_bloc.dart';
import '../widgets/custom_icon_btn.dart';
import '../widgets/custom_list_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    PreferredSize buildAppBar() => PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kGreen,
            flexibleSpace: Center(
              child: Container(
                alignment: Alignment.center,
                height: 45,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: const Text(
                  'Beranda',
                  style: TextStyle(color: kGreen, fontSize: 14),
                ),
              ),
            ),
          ),
        );

    Widget builMainFeature() => Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            decoration: BoxDecoration(
                color: kPrimary, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Text(
                  'BAGOGO',
                  style: kHeading3.copyWith(color: kWhite),
                ),
                const Spacer(),
                CustomIconButton(
                  icon: Icons.qr_code_scanner_rounded,
                  title: "SCAN QR",
                  onTap: () {
                    router.goNamed('initScan');
                  },
                ),
              ],
            ),
          ),
        );

    Widget buildListPassengers() => Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  "Penumpang",
                  style: kHeading5.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              BlocBuilder<QrCodeScannerBloc, QrCodeScannerState>(
                builder: (context, state) {
                  if (state is ScannerState) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.capturedDataList.length,
                      itemBuilder: (context, index) {
                        final datas = state.capturedDataList[index];
                        List<String> separatedTexts = datas.split(", ");
                        return CustomeListCard(
                          separatedTexts: separatedTexts,
                          arg: datas,
                        );
                      },
                    );
                  }
                  return const SizedBox();
                },
              )
            ],
          ),
        );

    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            builMainFeature(),
            buildListPassengers(),
          ],
        ),
      ),
    );
  }
}
