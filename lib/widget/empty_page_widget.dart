import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/utils/const.dart';
import 'package:pokemon/utils/custom_theme.dart';

class EmptyPageWidget extends StatelessWidget {
  const EmptyPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.ic_empty_state,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Data tidak tersedia",
              style: Theme.of(context)
                  .textTheme
                  .buttonRegular
                  .copyWith(color: AppColors.darkGray),
            ),
          ],
        ),
      ),
    );
  }
}
