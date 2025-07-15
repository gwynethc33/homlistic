import 'package:flutter/cupertino.dart';

import 'controller_bindings.dart';

class DependencyInjector extends StatefulWidget {
  final Widget child;
  const DependencyInjector({super.key, required this.child});

  @override
  State<DependencyInjector> createState() => _DependencyInjectorState();
}

class _DependencyInjectorState extends State<DependencyInjector> {
  late ControllerDataBindings _binding;

  @override
  void initState() {
    super.initState();
    _binding = ControllerDataBindings('https://api.homlistic.com:443/api/v1','');
    _binding.dependencies();
  }

  @override
  void dispose() {
    // Optionally, dispose of the binding here if needed.
    // If you used Get.put() instead of Get.lazyPut(),
    // you might want to dispose of it.
    // Get.delete<HomeController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}