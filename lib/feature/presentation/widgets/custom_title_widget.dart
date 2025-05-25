import 'package:doc_doc/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTitleWidget extends StatelessWidget {
  String?title;
  TextStyle? titleStyle;
   CustomTitleWidget({
    super.key,
     required this.title,
      this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$title",style: titleStyle??AppStyles.bold20Black,),
        InkWell(
            onTap: (){
              //Todo : Navigate to all Speciality
            },
            child: Text("See All",style: AppStyles.semiBold16Primary,)),

      ],
    );
  }
}
