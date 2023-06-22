import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TapButton extends StatefulWidget {
  /// Botão que expande ao ser tocado.
  /// Foi desenvolvido para fins didáticos em um desafio da Academia do Flutter no dia 20/06/2023.
  const TapButton({
    super.key,
    required this.text,
    required this.onTap,
    this.duration = const Duration(milliseconds: 100),
    this.backgroundColor = Colors.red,
    this.textColor,
    this.height = 50,
    this.width = 100,
    this.enabled = true,
    this.pulsePx = 5,
  });

  /// Texto a ser exibido no botão.
  final String? text;

  /// Função a ser executada ao clicar no botão.
  final Function? onTap;

  /// Duração da animação ao tocar o botão.
  final Duration duration;

  /// Cor de fundo do botão.
  final Color? backgroundColor;

  /// Cor do texto do botão.
  final Color? textColor;

  /// Valor em pixels que o botão se expande na animação ao tocar no botão.
  final int pulsePx;

  /// Altura do botão.
  final double height;

  /// Largura do botão.
  final double width;

  /// Define se o botão está habilitado ou não.
  final bool enabled;

  @override
  State<TapButton> createState() => _TapButtonState();
}

class _TapButtonState extends State<TapButton> {
  late double height;
  late double width;

  @override
  void initState() {
    super.initState();
    height = widget.height;
    width = widget.width;
  }

  Future<void> _animateContainer() async {
    setState(() {
      height = height + widget.pulsePx;
      width = width + widget.pulsePx;
    });
    await Future.delayed(widget.duration);
    setState(() {
      height = height - widget.pulsePx;
      width = width - widget.pulsePx;
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
        height: height,
        width: width,
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
