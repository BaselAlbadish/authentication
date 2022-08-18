import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../error/failures.dart';
import '../presentation/responsive_logic/logic.dart';

handleError(BuildContext context, Failure failure) {
  if (failure is NetworkFailure) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      content: Container(
        color: Colors.white24,
        height: getScreenHeight(context) - 400.h,
        width: getScreenWidth(context) - 100.w,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                failure.statusCode.toString(),
                style: TextStyle(color: Colors.red, fontSize: 30.sp),
              ),
              Text(
                failure.message.toString(),
                style: TextStyle(color: Colors.black, fontSize: 20.sp),
              ),
            ],
          ),
        ),
      ),
    );
  } else if (failure is FirebaseFailure) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      content: Container(
        color: Colors.white24,
        height: getScreenHeight(context) - 400.h,
        width: getScreenWidth(context) - 100.w,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                failure.message.toString(),
                style: TextStyle(color: Colors.black, fontSize: 20.sp),
              ),
            ],
          ),
        ),
      ),
    );
  } else if (failure is CacheFailure) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      content: Container(
        color: Colors.white24,
        height: getScreenHeight(context) - 400.h,
        width: getScreenWidth(context) - 100.w,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "some thing wrong ",
                style: TextStyle(color: Colors.red, fontSize: 30.sp),
              ),
              Text(
                "in your local storage",
                style: TextStyle(color: Colors.red, fontSize: 30.sp),
              ),
            ],
          ),
        ),
      ),
    );
  } else {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      content: Container(
        color: Colors.white24,
        height: getScreenHeight(context) - 400.h,
        width: getScreenWidth(context) - 100.w,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Unknown Error",
                style: TextStyle(color: Colors.red, fontSize: 30.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
