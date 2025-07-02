import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it_scope_study/presentation/home/view_model/home_view_model.dart';
import 'package:get_it_scope_study/presentation/widget/base/base_screen.dart';
import 'package:get_it_scope_study/router/router_path.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  Widget buildScreen(BuildContext context) {
    /// 사용자 정보 상태 Listener
    useListenable(viewModel.userState);

    return viewModel.userState.value.when(
      data: (user) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Home, userID: ${user.id}')),
          TextButton(
            onPressed: () {
              context.goNamed(RouterPath.detail);
            },
            child: Text('GO TO DETAIL'),
          ),
        ],
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
