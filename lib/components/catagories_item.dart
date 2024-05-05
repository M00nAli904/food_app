import 'package:flutter/material.dart';
import 'package:food_app/router/colors.dart';

class CatagoriesItem extends StatelessWidget {
  final bool isActive;
  final String image;
  final String title;
  final Function()? onTap;

  const CatagoriesItem(
      {Key? key, this.isActive = false, this.image = "", this.title = "",this.onTap,});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 140,
          decoration: BoxDecoration(
            color: appcolor.primary,
              border: Border.all(color: appcolor.primary, width: 2),
              borderRadius: BorderRadius.circular(50)),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Image.asset("assets/images/" + image),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    child: Text(title, style:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.w600,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}
