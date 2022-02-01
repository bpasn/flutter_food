import 'package:flutter/material.dart';
import 'package:flutter_layout/data/controller/popular_product_controller.dart';
import 'package:flutter_layout/models/products_models.dart';
import 'package:flutter_layout/screen/main_food_screen.dart';
import 'package:flutter_layout/screen/food_detail/recmomend_food_detail.dart';
import 'package:flutter_layout/until/app_constants.dart';
import 'package:flutter_layout/widget/app_icon.dart';
import 'package:flutter_layout/widget/icon_and_text_body.dart';
import 'package:flutter_layout/until/dimention.dart';
import 'package:flutter_layout/widget/app_column.dart';
import 'package:flutter_layout/widget/exandable_text.dart';
import 'package:flutter_layout/widget/text_widget.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({required this.pageId});

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        Get.find<PopularProductController>().popularProductList[pageId];
    print('page is id ' + pageId.toString());
    print('product name is ' + product.name.toString());
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.PopularFoodImaSize,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                // ignore: prefer_const_constructors
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        NetworkImage(AppConstants.UPLOAD_URL + product.img!)),
              ),
            ),
          ),
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(() => MainFoodScreen()),
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                  ),
                ],
              )),
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.PopularFoodImaSize - 20,
            bottom: 0,
            child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius15),
                    topRight: Radius.circular(Dimensions.radius15),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: AppColumn(
                        text: product.name!,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Container(child: BigText(text: "Introduce")),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandbleText(text: product.description!),
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (poplarProduct) => Container(
          height: Dimensions.buttonHeightBar,
          padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.width20,
            right: Dimensions.width20,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20 * 2),
              topRight: Radius.circular(Dimensions.radius20 * 2),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    bottom: Dimensions.height15,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.radius20)),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      GestureDetector(
                          onTap: () => {
                            poplarProduct.setQuantity(false)
                          }, child: Icon(Icons.remove)),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      BigText(text: poplarProduct.quantity.toString()),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      GestureDetector(onTap: () {
                         poplarProduct.setQuantity(true);
                      }, child: Icon(Icons.add))
                    ],
                  )),
              Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  bottom: Dimensions.height15,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(Dimensions.radius20)),
                child: BigText(text: "\$ ${product.price} | Add To Cart"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
