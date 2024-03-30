import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokemon/utils/const.dart';
import 'package:pokemon/utils/custom_theme.dart';

class ErrorPageWidget extends StatefulWidget {
  final String? messageError;
  final VoidCallback? onTap;
  const ErrorPageWidget({Key? key, this.messageError, this.onTap})
      : super(key: key);

  @override
  State<ErrorPageWidget> createState() => _ErrorPageWidgetState();
}

class _ErrorPageWidgetState extends State<ErrorPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.triangleExclamation,
                    size: MediaQuery.of(context).size.width * 0.5,
                    color: Colors.orange,
                  ),
                  Text(
                    widget.messageError ?? "",
                    style: Theme.of(context).textTheme.subHeading1,
                  )
                ],
              ),
            ),
          ),
          if (widget.onTap != null)
            Container(
              padding: EdgeInsets.all(16.w),
              child: GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  height: 52.h,
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(48.h),
                  ),
                  child: Text(
                    "Coba lagi",
                    style: Theme.of(context)
                        .textTheme
                        .buttonRegular
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
