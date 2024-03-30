import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallMenuItem extends StatelessWidget {
  const SmallMenuItem({
    Key? key,
    required this.text,
    this.color,
  }) : super(key: key);

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Material(
        color: color ?? Colors.amber,
        borderRadius: BorderRadius.circular(25),
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 80.w),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.h),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
