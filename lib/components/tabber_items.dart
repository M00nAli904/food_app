
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabBarItems extends StatelessWidget {
  final bool isactive;
 final  String icons;
    const TabBarItems({super.key,this.isactive=false, this.icons= ""});
    @override
    Widget build(BuildContext context) {
      return Container(
        child: Padding( padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Container(
                height: 25,
                width: 25,
                child: SvgPicture.asset(icons, colorFilter:ColorFilter.mode(Colors.white, BlendMode.srcIn),)
              ),
              SizedBox(height: 10,),
              isactive ?
              Container(
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(200)
                ),

              ):
              SizedBox(width: 2,),
            ],
          ),
        ),
      );
    }
  }

