import 'package:ecommerce/src/core/utils/colors/colors.dart';
import 'package:ecommerce/src/shared/presentation/pages/main_pages/category/category.dart';
import 'package:ecommerce/src/shared/presentation/pages/main_pages/home/dashboard.dart';
import 'package:ecommerce/src/shared/presentation/pages/main_pages/mycart/mycart.dart';
import 'package:ecommerce/src/shared/presentation/pages/main_pages/profile/profile_page.dart';
import 'package:ecommerce/src/shared/presentation/pages/main_pages/wishlist/wishlist.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> changeValueNotifier = ValueNotifier(0);
List<Widget> pages = [
  const DashBoardPage(),
  const CategoryPage(),
  const MycartPage(),
  const WishListPage(),
  const ProfilePage()
];

class BottomNavigationBarPage extends StatelessWidget {
  const BottomNavigationBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: changeValueNotifier,
        builder: (context, indexValue, child) {
          return Scaffold(
            body: pages[indexValue],
            bottomNavigationBar: FlashyTabBar(
              animationDuration: const Duration(milliseconds: 1300),
              selectedIndex: changeValueNotifier.value,
              iconSize: 30.0,
              showElevation: true,
              onItemSelected: (index) {
                changeValueNotifier.value = index;
              },
              items: [
                FlashyTabBarItem(
                    icon: const Icon(Icons.home), title: const Text("Home")),
                FlashyTabBarItem(
                    icon: const Icon(Icons.category_outlined),
                    title: const Text("Categories")),
                FlashyTabBarItem(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    title: const Text("MyCart")),
                FlashyTabBarItem(
                    icon: const Icon(Icons.favorite_border_outlined),
                    title: const Text("Wishlist")),
                FlashyTabBarItem(
                    icon: const Icon(Icons.person_2_outlined),
                    title: const Text("Profile"))
              ],
            ),
          );
        });
  }
}
