import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/components/tabber_items.dart';
import 'package:food_app/home/home_view.dart';
import 'package:food_app/root/root_controller.dart';
import 'package:food_app/router/colors.dart';
import 'package:get/get.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: _buildBody(),
        bottomNavigationBar: _buildFooter(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,
          child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: SvgPicture.asset("assets/icons/cart (1).svg", color: appcolor.primary,
              )),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
  Widget _buildBody() {
    return IndexedStack(
      index: controller.tabIndex.value,
      children: [HomeView(), Container()],
    );
  }
  Widget _buildFooter() {
    return AnimatedBottomNavigationBar.builder(
      onTap: (index) {
        controller.tabIndex.value = index;
      },
      itemCount: controller.tabs.length,
      backgroundColor: appcolor.primary,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      tabBuilder: (int index, bool isActive) {
        return TabBarItems(
          isactive: isActive,
          icons: controller.tabs[index],
        );
      },
      activeIndex: controller.tabIndex.value,
    );
  }
}
