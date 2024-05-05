import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/router/colors.dart';
class CustomQuantity extends StatelessWidget {
  const CustomQuantity({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 35,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40), color: appcolor.primary),
          child: Row(
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(child: Text("-", style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )),
              ),
          Expanded(
              child: Text("1",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.yellow ),)),

              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                    child: Text("+", style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
