import 'package:flutter/material.dart';
import 'package:get_it_scope_study/presentation/splash/view_model/splash_view_model.dart';
import 'package:get_it_scope_study/presentation/widget/base/base_screen.dart';

class SplashScreen extends BaseScreen {
  const SplashScreen({super.key, required this.viewModel});

  final SplashViewModel viewModel;

  @override
  Widget buildScreen(BuildContext context) {
    return Center(child: Text('Splash Screen'));
  }
}
