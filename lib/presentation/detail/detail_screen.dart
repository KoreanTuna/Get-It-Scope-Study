import 'package:flutter/material.dart';
import 'package:get_it_scope_study/presentation/detail/view_model/detail_view_model.dart';
import 'package:get_it_scope_study/presentation/widget/base/base_screen.dart';

class DetailScreen extends BaseScreen {
  const DetailScreen({super.key, required this.viewModel});

  final DetailViewModel viewModel;

  @override
  Widget buildScreen(BuildContext context) {
    return Center(child: Text('Detail Screen'));
  }
}
