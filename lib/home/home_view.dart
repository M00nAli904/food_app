import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/components/catagories_tab.dart';
import 'package:food_app/data/product_data.dart';
import 'package:food_app/router/app_rout_name.dart';
import 'package:food_app/router/colors.dart';
import 'package:get/get.dart';
import '../components/product_item.dart';
import '../router/constant.dart';
class HomeView extends GetView {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }
  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: _getHeader(),
            ),
            pinned: false,
            expandedHeight:80,
            backgroundColor: Colors.white,
          ),
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: _getSearch(),
            ),
            pinned: true,
            expandedHeight:30,
            backgroundColor: Colors.white,
          ),
          SliverToBoxAdapter(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [ _getCatagories(), _getPapuler()],
          ),
        )),
      ) ] ),
    );
  }
  Widget _getHeader() {
    return SafeArea(
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(left: gap, right: gap, top: gap),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hey,Sundy", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 5),
                  Text(
                    "Let's find quantity food",
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: appcolor.primary),
                  )
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(gap),
                child: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset("assets/images/WhatsApp Image 2023-09-22 at 15.54.48.jpg")),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSearch() {
    return Container(
        padding: EdgeInsets.only(left: 15, right: gap, top:10),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Container(
                    decoration: const BoxDecoration(boxShadow: [
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
                              child:
                                  SvgPicture.asset("assets/icons/search.svg"),
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
              SizedBox(width: 10),

              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(gap),
                    color: Colors.yellow),
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 25,
                  width: 25,
                  child: SvgPicture.asset("assets/icons/filter.svg"),
                ),
              ),
            ],
          ),
        ));


  }

  Widget _getCatagories() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(left: gap, right: gap),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: gap),
                  child: Text(
                    "Catagories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: gap,
              ),
              CatagoriesTab()
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPapuler() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: gap),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: gap, right: gap),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Populer",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w200,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(height: gap),
            Column(
              children: List.generate(PRODUCT.length, (index) {
                var product = PRODUCT[index];
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRouterName.detail,
                        arguments: {"data": product});
                  },
                  child: ProductItem(
                    tag: product["id"],
                    title: product["title"],
                    description: product["description"],
                    calories: product["calories"],
                    price: product["price"],
                    image: product["image"],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
