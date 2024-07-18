import 'package:ecommerce/src/core/utils/colors/colors.dart';
import 'package:ecommerce/src/core/utils/constant/width_height.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {super.key,
      this.keyboardType,
      this.onChanged,
      this.obscureText = false,
      this.controller,
      this.suffixIcon,
      this.fillColor,
      this.suffixOnPressed,
      this.suffixIconColor,
      this.preffixIcon,
      this.label,
      this.hintText,
      this.validator,
      this.maxLines = 1,
      this.star,
      this.isSearch = false});
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final bool obscureText;
  final TextEditingController? controller;
  final int maxLines;
  final IconData? suffixIcon;
  final Color? fillColor;
  final void Function()? suffixOnPressed;
  final Color? suffixIconColor;
  final IconData? preffixIcon;
  final String? label;
  final String? hintText;
  final String? star;
  final String? Function(String?)? validator;
  final bool isSearch;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isSearch
            ? Container()
            : RichText(
                text: TextSpan(
                  text: label,
                  style: GoogleFonts.poppins(
                      fontSize: 17, fontWeight: FontWeight.w500, color: kBlack),
                  children: [
                    TextSpan(
                        text: star, style: GoogleFonts.poppins(color: kRed)),
                  ],
                ),
              ),
        isSearch ? Container() : kHeight10,
        TextFormField(
          keyboardType: keyboardType,
          onChanged: onChanged,
          obscureText: obscureText,
          controller: controller,
          maxLines: maxLines,
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: isSearch ? BorderSide.none : const BorderSide()),
            fillColor: fillColor,
            suffixIcon: IconButton(
                onPressed: suffixOnPressed,
                icon: Icon(
                  suffixIcon,
                  color: suffixIconColor,
                )),
            prefixIcon: Icon(
              preffixIcon,
              color: isSearch ? kDarkBlueColor : kBlack,
            ),
            hintText: hintText,
            focusedBorder: isSearch
                ? null
                : const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(color: kWAppColor)),
          ),
        ),
      ],
    );
  }
}
