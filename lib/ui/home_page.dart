import 'package:clase_4_diplomado/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<UserViewModel>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nombre actual: ${vm.name}'),
            const SizedBox(height: 20),
            TextField(onSubmitted: (value) => vm.changeName(value)),
          ],
        ),
      ),
    );
  }
}
