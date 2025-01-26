import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';

class ProfileStatusCard extends StatelessWidget {
  final IconData statusIcon;
  final String statusValue;
  final String statusTitle;

  const ProfileStatusCard({
    super.key,
    required this.statusIcon,
    required this.statusValue,
    required this.statusTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            statusIcon,
            color: kSubMainColor,
            size: 30,
          ),
          const SizedBox(height: 10),
          Text(
            statusValue,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: kBlackColor,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            statusTitle,
            style: const TextStyle(
              fontSize: 12,
              color: kGreyColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
