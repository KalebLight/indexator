import 'package:flutter/material.dart';
import 'package:indexator/app/core/data/colors_data.dart';
import 'package:indexator/app/core/data/font_data.dart';
import 'package:indexator/app/core/data/status.dart';

class ButtonDefault extends StatelessWidget {
  final Function onTap;
  final String label;
  final Color? backgroundColor;
  final StatusDefault status;

  const ButtonDefault({
    Key? key,
    required this.onTap,
    required this.label,
    this.backgroundColor,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: InkWell(
        onTap: () => onTap.call(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            border: Border.all(color: ColorsData.white_1),
            boxShadow: [
              BoxShadow(color: ColorsData.black_1.withOpacity(0.25), offset: const Offset(0, 4), blurRadius: 4),
            ],
            color: backgroundColor ?? ColorsData.black_1,
          ),

          width: 260,
          height: 45, //60,
          child: Center(
            child: status is StatusLoading
                ? const SizedBox(
                    width: 50,
                    child: LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(ColorsData.black_1),
                      backgroundColor: Colors.white,
                    ),
                  )
                : Text(
                    label,
                    style: FontData.button(ColorsData.white_1),
                  ),
          ),
        ),
      ),
    );
  }
}
