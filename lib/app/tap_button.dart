import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TapButton extends StatefulWidget {
  TapButton({
    super.key,
    required this.text,
    required this.onTap,
    this.duration = const Duration(milliseconds: 500),
    this.backgroundColor = Colors.red,
    this.textColor,
    this.height = 50,
    this.width = 100,
    this.enabled = true,
    this.pulsePx = 5,
  });

  final String? text;
  final Function? onTap;
  final Duration duration;
  final Color? backgroundColor;
  final Color? textColor;
  final int pulsePx;
  double height;
  double width;
  bool enabled;

  @override
  State<TapButton> createState() => _TapButtonState();
}

class _TapButtonState extends State<TapButton> {
  Future<void> _animateContainer() async {
    setState(() {
      widget.height = widget.height + widget.pulsePx;
      widget.width = widget.width + widget.pulsePx;
    });
    await Future.delayed(const Duration(milliseconds: 50));
    setState(() {
      widget.height = widget.height - widget.pulsePx;
      widget.width = widget.width - widget.pulsePx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) widget.onTap!();
        if (widget.enabled) _animateContainer();
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.all(10),
        duration: widget.duration,
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: widget.enabled ? widget.backgroundColor : Colors.grey.withOpacity(0.6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(-1, 1),
            ),
          ],
        ),
        child: Center(
            child: AutoSizeText(
          widget.text ?? '',
          style: TextStyle(
            color: widget.enabled ? widget.textColor ?? Colors.white : widget.textColor ?? Colors.black.withOpacity(0.4),
            fontSize: 26,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )),
      ),
    );
  }
}
