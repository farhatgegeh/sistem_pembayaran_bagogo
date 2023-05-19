import 'package:flutter/material.dart';

import '../../config/theme/themes.dart';
import '../../utils/constants.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 70,
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: kPrimary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: kHeading6.copyWith(color: kWhite, fontSize: 14),
          )
        ],
      ),
    );
  }
}
