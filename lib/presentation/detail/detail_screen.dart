import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it_scope_study/presentation/detail/view_model/detail_view_model.dart';
import 'package:get_it_scope_study/presentation/widget/base/base_screen.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends BaseScreen {
  const DetailScreen({super.key, required this.viewModel});

  final DetailViewModel viewModel;

  @override
  Widget buildScreen(BuildContext context) {
    useEffect(() {
      /// DetailScreen useEffect

      return () {};
    }, []);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Detail Screen'),
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('GO BACK'),
          ),
        ],
      ),
    );
  }
}
