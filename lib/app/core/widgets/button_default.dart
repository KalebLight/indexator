import 'package:flutter/material.dart';
import 'package:indexator/app/core/data/colors_data.dart';
import 'package:indexator/app/core/data/font_data.dart';
import 'package:indexator/app/core/data/status.dart';

class ButtonDefault extends StatefulWidget {
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
  _ButtonDefaultState createState() => _ButtonDefaultState();
}

class _ButtonDefaultState extends State<ButtonDefault> {
  late Color _currentColor;

  @override
  void initState() {
    super.initState();

    _currentColor = widget.backgroundColor ?? ColorsData.gunmetal;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: InkWell(
        onTap: () => widget.onTap.call(),
        onHover: (isHovering) {
          setState(() {
            _currentColor = isHovering ? ColorsData.gunmetal : (widget.backgroundColor ?? ColorsData.gunmetal);
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: ColorsData.white_1),
            boxShadow: [
              BoxShadow(color: ColorsData.black_1.withOpacity(0.25), offset: const Offset(0, 4), blurRadius: 4),
            ],
            color: _currentColor,
          ),
          width: 260,
          height: 45,
          child: Center(
            child: widget.status is StatusLoading
                ? const SizedBox(
                    width: 50,
                    child: LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(ColorsData.black_1),
                      backgroundColor: Colors.white,
                    ),
                  )
                : Text(
                    widget.label,
                    style: FontData.button(ColorsData.white_1),
                  ),
          ),
        ),
      ),
    );
  }
}
