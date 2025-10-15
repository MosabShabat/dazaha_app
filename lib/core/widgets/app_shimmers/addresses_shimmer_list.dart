import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/spacing.dart';
import 'custom_shimmer.dart';

Widget shimmerAddressList() {
  return Container(
    color: Colors.transparent,
    width: double.infinity,
    child: Column(
      children: [
        verticalSpace(14),
        Row(
          children: [
            CustomShimmer(width: 50, height: 50, borderRadius: 50),
            horizontalSpace(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomShimmer(width: 40.w, height: 6),
                verticalSpace(6),
                CustomShimmer(width: 60.w, height: 6),
                verticalSpace(6),
              ],
            ),
          ],
        ),
        verticalSpace(14),
      ],
    ),
  );
}

Widget addressListShimmer(BuildContext context, bool? isPadding) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: isPadding == true ? 16 : 0),
    child: ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsetsDirectional.only(
            top: index == 0 ? 0 : 16.w,
            bottom: index == 4 ? 0 : 0,
          ),
          child: shimmerAddressList(),
        );
      },
    ),
  );
}
