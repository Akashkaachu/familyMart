import 'package:ecommerce/src/core/utils/colors/colors.dart';
import 'package:ecommerce/src/core/utils/constant/width_height.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    this.fontWeight,
    this.fontSize,
    this.color,
  });
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontWeight: fontWeight, fontSize: fontSize, color: color),
    );
  }
}

////////////
class ProfilePersonalInfoListTileWidget extends StatelessWidget {
  const ProfilePersonalInfoListTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileWidget(
          text: "Shipping Address",
          trailing: Icons.arrow_forward_ios,
          leading: Icons.place_outlined,
          onTap: () {},
        ),
        ListTileWidget(
          text: "Payment Method",
          trailing: Icons.arrow_forward_ios,
          leading: Icons.payments_outlined,
          onTap: () {},
        ),
        ListTileWidget(
          text: "Order History",
          leading: Icons.history,
          trailing: Icons.arrow_forward_ios,
          onTap: () {},
        ),
      ],
    );
  }
}

////
class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.trailing,
    required this.text,
    required this.onTap,
    required this.leading,
  });
  final Function()? onTap;
  final IconData trailing;
  final IconData leading;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      trailing: Icon(trailing),
      leading: FaIcon(
        leading,
        color: kBlack,
      ),
      onTap: onTap,
    );
  }
}
//////

class ProfileSupportAndInfoWidget extends StatelessWidget {
  const ProfileSupportAndInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextWidget(
            text: "Support & Information",
            fontWeight: FontWeight.w600,
          ),
        ),
        kHeight10,
        ListTileWidget(
            trailing: Icons.arrow_forward_ios,
            text: 'Privacy Policy',
            onTap: () {},
            leading: Icons.shield_outlined),
        ListTileWidget(
            trailing: Icons.arrow_forward_ios,
            text: 'Terms & Condition',
            onTap: () {},
            leading: Icons.notes),
        ListTileWidget(
            trailing: Icons.arrow_forward_ios,
            text: 'FAQs',
            onTap: () {},
            leading: Icons.message_outlined)
      ],
    );
  }
}

////
///
class ProfileAccountMangementWidget extends StatelessWidget {
  const ProfileAccountMangementWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextWidget(
              text: "Account Management", fontWeight: FontWeight.w600),
        ),
        ListTileWidget(
            trailing: Icons.arrow_forward_ios,
            text: "Change Password",
            onTap: () {},
            leading: Icons.lock_outline_rounded),
        ListTileWidget(
            trailing: Icons.toggle_on_outlined,
            text: "Dark Theme",
            onTap: () {},
            leading: Icons.phone_android_rounded),
      ],
    );
  }
}
