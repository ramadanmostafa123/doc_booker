// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doc_booker/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doc_booker/core/routing/app_router.dart';

class DocBooker extends StatelessWidget {
  const DocBooker({
    Key? key,
    required this.appRouter,
  }) : super(key: key);
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Doc Booker',
        theme: ThemeData(primarySwatch: Colors.deepPurple,),
        initialRoute: Routes.onBoarding,
        onGenerateRoute: appRouter.generateRote,
      ),
    );
  }
}
