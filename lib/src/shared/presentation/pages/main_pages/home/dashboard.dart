import 'package:ecommerce/src/core/utils/colors/colors.dart';
import 'package:ecommerce/src/core/utils/constant/width_height.dart';
import 'package:ecommerce/src/shared/presentation/pages/simple_pages/sign_up_in/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/animations/Icon.json",
                height: size.height * 0.1),
            Text(
              'Family Mart'.toUpperCase(),
              style: const TextStyle(color: kDarkBlueColor),
            )
          ],
        ),
        leading: const Center(
          child: FaIcon(
            FontAwesomeIcons.bars,
            color: kDarkBlueColor,
          ),
        ),
        actions: [
          Stack(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.transparent,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: kDarkBlueColor.withOpacity(0.1),
                  child: const FaIcon(
                    FontAwesomeIcons.bell,
                    color: kDarkBlueColor,
                  ),
                ),
              ),
              const Positioned(
                right: 0,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: kDarkBlueColor,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 5)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: ListView(
          children: [
            kHeight10,
            TextFormFieldWidget(
              hintText: 'Search any Product...',
              isSearch: true,
              preffixIcon: CupertinoIcons.search,
              fillColor: kDarkBlueColor.withOpacity(0.1),
            ),
            kHeight10,
            const Row(
              children: [
                Text(
                  'All Featured',
                  style: TextStyle(fontSize: 23),
                )
              ],
            ),
            kHeight10,
            SizedBox(
              height: size.height * 0.15,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  10,
                  (index) => const Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage('assets/images/productimage.jpeg'),
                          ),
                          Text('Beauty')
                        ],
                      ),
                      kWidth10
                    ],
                  ),
                ),
              ),
            ),
            kHeight10,
          ],
        ),
      ),
    );
  }
}
