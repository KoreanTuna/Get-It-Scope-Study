import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it_scope_study/presentation/splash/view_model/splash_view_model.dart';
import 'package:get_it_scope_study/presentation/widget/base/base_screen.dart';
import 'package:get_it_scope_study/router/router_path.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends BaseScreen {
  const SplashScreen({super.key, required this.viewModel});

  final SplashViewModel viewModel;

  @override
  Widget buildScreen(BuildContext context) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        context.goNamed(RouterPath.home);
      });
    }, []);

    return Center(child: Text('Splash Screen'));
  }
}
