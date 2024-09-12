import 'package:flutter/material.dart';
import 'package:indexator/app/core/data/colors_data.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  const LoadingWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: const CircularProgressIndicator(
          color: ColorsData.gunmetal,
        ),
      ),
    );
  }
}
