import 'package:eats/core/extension/extension.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final IconData? activeIcon;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeIcon,
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
      value: widget.value ? 1.0 : 0.0,
    );
  }

  @override
  void didUpdateWidget(covariant CustomSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _controller.animateTo(widget.value ? 1.0 : 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 50.0,
        height: 30.0,
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: context.appColors.tertiary,
        ),
        child: Stack(
          children: [
            Align(
              alignment:
                  widget.value ? Alignment.centerRight : Alignment.centerLeft,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 24.0,
                height: 24.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.value
                      ? context.appColors.primary
                      : context.appColors.secondary,
                ),
                child: widget.value
                    ? Icon(widget.activeIcon ?? Icons.check, size: 16.0, color: Colors.white)
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
