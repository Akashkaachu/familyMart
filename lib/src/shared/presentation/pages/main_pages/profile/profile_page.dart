import 'package:ecommerce/src/core/utils/colors/colors.dart';
import 'package:ecommerce/src/core/utils/constant/width_height.dart';
import 'package:ecommerce/src/core/utils/usecases/profile_refactory.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: size.width,
                height: (size.height / 2) * 0.3,
                color: kWAppColor,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                    width: (size.width),
                    height: (size.height / 2) * 0.09,
                    decoration: const BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                    ),
                    child: const Padding(
                        padding: EdgeInsets.only(top: 18, left: 8),
                        child: TextWidget(
                            text: "Personal Information",
                            fontWeight: FontWeight.w600))),
              ),
            ],
          ),
          const ProfilePersonalInfoListTileWidget(),
          const ProfileSupportAndInfoWidget(),
          const ProfileAccountMangementWidget()
        ],
      )),
    );
  }
}
