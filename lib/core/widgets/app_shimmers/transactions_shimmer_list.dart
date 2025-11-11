import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/spacing.dart';
import 'custom_shimmer.dart';

Widget shimmerTransactionsList() {
  return Padding(
    padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
    child: Container(
      color: Colors.transparent,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomShimmer(width: 50, height: 50, borderRadius: 50),
              horizontalSpace(8),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomShimmer(width: 60, height: 6),
                    verticalSpace(16),
                    CustomShimmer(width: 90, height: 6),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomShimmer(width: 60, height: 6),
                    verticalSpace(16),
                    CustomShimmer(width: 30, height: 6),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget transactionsListShimmer(BuildContext context, bool? isPadding) {
  return ListView.builder(
    itemCount: 6,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return Container(
        margin: EdgeInsetsDirectional.only(
          top: index == 0 ? 0 : 16.w,
          bottom: index == 4 ? 0 : 0,
        ),
        child: shimmerTransactionsList(),
      );
    },
  );
}
