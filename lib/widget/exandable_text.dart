import 'package:flutter/material.dart';
import 'package:flutter_layout/until/dimention.dart';
import 'package:flutter_layout/widget/text_widget.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ExpandbleText extends StatefulWidget {
  final String text;
  ExpandbleText({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandbleTextState createState() => _ExpandbleTextState();
}

class _ExpandbleTextState extends State<ExpandbleText> {
  late String fistHalf;
  late String secconhalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      fistHalf = widget.text.substring(0, textHeight.toInt());
      secconhalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      fistHalf = widget.text;
      secconhalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secconhalf.isEmpty
          ? SmallText(text: fistHalf,size: Dimensions.font16,)
          : Column(
              children: [
                SmallText(
                  height: 1.8,
                  size: Dimensions.font16,
                    text: hiddenText
                        ? (fistHalf + " ...")
                        : (fistHalf + secconhalf),
                        color: Colors.grey.shade400,
                        ),
                InkWell(
                  onTap: () => setState(() {
                    hiddenText = !hiddenText;
                  }),
                  child: Row(
                    children: [
                      SmallText(text: "Show more", color: Colors.blueGrey,
                        size: Dimensions.font16,
                      ),
                      Icon(hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up,color: Colors.blueAccent,)
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
