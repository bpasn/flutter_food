import 'package:flutter/material.dart';
import 'package:flutter_layout/models/products_models.dart';
import 'package:flutter_layout/widget/icon_and_text_body.dart';
import 'package:flutter_layout/until/dimention.dart';
import 'package:flutter_layout/widget/text_widget.dart';

class AppColumn extends StatelessWidget {
  late final String text;
  AppColumn({required String text, product}) {
    this.text = text;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font26),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
               5,
                (index) => const Icon(
                  Icons.star,
                  color: Colors.blue,
                  size: 15,
                ),
              ),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text:'5', color: Colors.grey),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: "1200", color: Colors.grey),
            SizedBox(
              width: Dimensions.width5,
            ),
            SmallText(text: "Comments", color: Colors.grey),
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndTextWidget(
                icon: Icons.circle,
                iconColor: Colors.amberAccent,
                text: 'Normal',
              ),
              IconAndTextWidget(
                icon: Icons.location_on,
                iconColor: Colors.blue[200],
                text: '1.4km',
              ),
              IconAndTextWidget(
                icon: Icons.access_time,
                iconColor: Colors.orangeAccent,
                text: '34mim',
              ),
            ],
          ),
        )
      ],
    );
  }
}
