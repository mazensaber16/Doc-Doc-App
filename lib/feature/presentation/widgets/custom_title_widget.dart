import 'package:doc_doc/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTitleWidget extends StatelessWidget {
  String?title;
  TextStyle? titleStyle;
  GestureTapCallback? onSeeAllTap;
   CustomTitleWidget({
    super.key,
     required this.title,
      this.titleStyle,
     this.onSeeAllTap
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$title",style: titleStyle??AppStyles.bold20Black,),
        InkWell(
            onTap:onSeeAllTap,
            child: Text("See All",style: AppStyles.semiBold16Primary,)),

      ],
    );
  }
}
