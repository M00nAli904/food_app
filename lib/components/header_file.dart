import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/router/colors.dart';

import '../router/constant.dart';

class HeaderFile extends SliverPersistentHeaderDelegate {

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 6,
                      spreadRadius: 6,
                      offset: Offset(0, 3),
                      color: Colors.white)
                ]),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Search food...",
                      hintStyle: TextStyle(color: appcolor.primary),
                      filled: true,
                      fillColor: Colors.greenAccent,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          height: 20,
                          width: 20,
                          child: SvgPicture.asset("assets/icons/search.svg"),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(gap),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(gap),
                          borderSide: BorderSide.none)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(gap), color: Colors.yellow),
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Container(
              height: 25,
              width: 25,
              child: SvgPicture.asset("assets/icons/filter.svg"),
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 30;

  @override
  double get minExtent =>30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
