
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/components/custom_quantity.dart';
import 'package:food_app/details/detail_controller.dart';
import 'package:get/get.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  AppBar _buildAppBar() {
    return AppBar(
      title:Text( controller.data["title"],style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),) ,
      elevation: 0,
      actions: [
      Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          Get.back();
        },
        borderRadius: BorderRadius.circular(100),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),

          ),margin: EdgeInsets.only(right: 10),
          height: 25,width:25,
          child: SvgPicture.asset("assets/icons/bag-bold (1).svg",),
        ),
      ),
    )
      ],
    );
  }
  Widget _buildBody(){
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(5),
            child: Stack(
              children:[
              Container(
                height: Get.height* 0.43,
                width: Get.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset("assets/images/product-background.jpg"),
                ),
              ),
            Container(
              padding: EdgeInsets.only(top: 60,left: 50,right: 50),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Hero(
                    tag: controller.data["id"],
                    child: Image.asset("assets/images/" + controller.data["image"] )),
              ),
            ),
            
              ] ),
          ),
          Container(
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                _getProductInformation(),
                SizedBox(height: 30,),
                _getDetail(),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _getProductInformation (){
   return Column(
     children: [
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Row(
             children: [_getIcon(
                   icons: "fire.png",title: controller.data["calories"]),
                SizedBox(width: 15),
               _getIcon(icons:"star.png",title:"5.0"),
             ],
           ),
           Text("\$"+ controller.data["price"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)
         ],
       ),
       SizedBox(height: 10,),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [_getIcon(icons: "clock.png",title: "15_20 Mints"),
           CustomQuantity()
         ]
       ),
     ],
   );
  }
    Widget _getDetail(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(" Information",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
        ),
        SizedBox(height:10 ,),
        Text(" Pizza is a dish of Italian origin consisting of a usually round flat base of leavened wheat_based dough toped with tomatoes, cheese and ofter various other ingradients, which is backed at a high temperature, traditionally in a wood fired oven ",style: TextStyle(fontSize:12,fontWeight: FontWeight.w200),)
      ],
    );

    }
   _getIcon({
      String icons="",
      String title="",
 }){
  return Row(
    children: [
      Container(
      height: 25,
      width: 25,
        child: Image.asset("assets/images/" + icons),
      ),
      SizedBox(width: 10,),
      Text(title,style: TextStyle(color: Colors.black.withOpacity(0.5)),)
    ],
  );
   }
}
