import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/router/colors.dart';
import 'package:food_app/router/constant.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final String description;
  final String calories;
  final String price;
  final String image;
  final String tag;

  const ProductItem({
    Key? key,
    this.title = "",
    this.description = "",
    this.calories = "",
    this.price = "",
    this.image = "",
    this.tag = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 340,
        margin: const EdgeInsets.only(bottom: gap),
        padding: const EdgeInsets.only(top: 15, left: gap, right: gap, bottom: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(gap),
            boxShadow: const [
              BoxShadow(
                blurRadius: 6,
                spreadRadius: 6,
                color: Colors.grey,
                offset: Offset(0, 3),
              )
            ]),
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          height: 1.2,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                          height: 1.2,
                          color: Colors.black),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          child: Image.asset("assets/images/fire.png"),
                        ),
                        SizedBox(width: 5),
                        Text(
                          calories,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.deepOrangeAccent),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "\$" + price,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ],
                )),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        spreadRadius: 6,
                        offset: Offset(0, 3),
                        color: Colors.black.withOpacity(0.04),
                      ),
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    child: Hero(
                        tag: tag,
                        child: Image.asset("assets/images/" + image)),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
