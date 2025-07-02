import 'package:flutter/material.dart';
import 'package:get_it_scope_study/environment/getit/getit.dart';

class CustomScope extends StatefulWidget {
  const CustomScope({
    super.key,
    required this.name,
    this.dispose = false,
    required this.builder,
  });

  final String name;
  final bool dispose;
  final WidgetBuilder builder;

  @override
  State<CustomScope> createState() => _CustomScopeState();
}

class _CustomScopeState extends State<CustomScope> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    locator.popScope();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
