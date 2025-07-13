import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox verticalSpace(double height) => SizedBox(height: height.h);

SizedBox horizontalSpace(double width) => SizedBox(width: width.w);

var Width = ScreenUtil().screenWidth;
var Height = ScreenUtil().screenHeight;
var SizeBox20H = SizedBox(height: 20.h);
