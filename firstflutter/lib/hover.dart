import 'package:flutter/material.dart';

class HoverContainer extends StatefulWidget {
  final Widget child;
  final Color color;

  const HoverContainer({Key? key, required this.child, required this.color})
    : super(key: key);

  @override
  _HoverContainerState createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.all(5),
        width: _hovering ? 606 : 600,
        height: _hovering ? 326 : 320,
        decoration: BoxDecoration(
          color: widget.color,
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 20,
              offset: Offset(0, 6),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: widget.child),
      ),
    );
  }
}
