import 'package:doc_booker/core/routing/app_router.dart';
import 'package:doc_booker/doc_booker.dart';
import 'package:flutter/material.dart';

void main() {
  

  
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DocBooker(
    appRouter: AppRouter(),
  ));
}
