import 'package:doc_booker/core/di/get_it.dart';
import 'package:doc_booker/core/routing/app_router.dart';
import 'package:doc_booker/doc_booker.dart';
import 'package:flutter/material.dart';

void main() {
  setUpGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DocBooker(
    appRouter: AppRouter(),
  ));
}
