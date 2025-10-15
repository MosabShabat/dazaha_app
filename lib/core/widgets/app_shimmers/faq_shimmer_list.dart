import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_shimmer.dart';

Widget FaqShimmerItem() {
  return Container(
    color: Colors.transparent,
    width: double.infinity,
    child: Column(
      children: [CustomShimmer(width: double.infinity, height: 60)],
    ),
  );
}

Widget faqListShimmer(BuildContext context, bool? isPadding) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: isPadding == true ? 16 : 0),
    child: ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsetsDirectional.only(
            top: index == 0 ? 0 : 16.w,
            bottom: index == 4 ? 0 : 0,
          ),
          child: FaqShimmerItem(),
        );
      },
    ),
  );
}
