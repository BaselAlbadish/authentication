import 'package:company_test/configure.dart';
import 'package:company_test/core/presentation/widgets/app_bar.dart';
import 'package:company_test/core/utility/local_datasource/local_data_source.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../authentication/sign_in/core/local_constant.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MainAppBar(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: getIt<LocalDataSource>().get(imageURL),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: getIt<LocalDataSource>().get(imageURL) == null
                          ? imageProvider
                          : AssetImage("assets/images/default_image.png"),
                      fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Column(
              children: [
                Text("Name :", style: TextStyle(fontSize: 18.sp)),
                SizedBox(height: 10.h),
                Text(getIt<LocalDataSource>().get(name) ?? "nothing", style: TextStyle(fontSize: 14.sp)),
              ],
            ),
            Column(
              children: [
                Text("Email :", style: TextStyle(fontSize: 18.sp)),
                SizedBox(height: 10.h),
                Text(getIt<LocalDataSource>().get(email) ?? "nothing", style: TextStyle(fontSize: 14.sp)),
              ],
            ),
            Column(
              children: [
                Text("Phone Number :", style: TextStyle(fontSize: 18.sp)),
                SizedBox(height: 10.h),
                Text(getIt<LocalDataSource>().get(phoneNumber) ?? "nothing", style: TextStyle(fontSize: 14.sp)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
