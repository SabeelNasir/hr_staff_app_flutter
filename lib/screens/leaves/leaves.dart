import 'package:flutter/material.dart';
import '../../layouts/main-layout.dart';

class Leaves extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LeavesState();
  }
}

class _LeavesState extends State<Leaves> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBarTitle: 'Leaves',
      bodyWidget: null,
    );
  }
}
