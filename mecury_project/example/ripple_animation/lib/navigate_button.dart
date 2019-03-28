import 'package:flutter/material.dart';
import 'route.dart';

class NavigateButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final Color splashColor;
  final Color iconColor;
  final Object heroTag;
  final Widget nextScreen;
  final double rangeFactor;

  NavigateButton(
      {IconData icon = Icons.navigate_next,
      Color color = Colors.blue,
      Color splashColor = Colors.white,
      Color iconColor = Colors.white,
      Object heroTag = '',
      double rangeFactor = 2.5,
      @required this.nextScreen})
      : icon = icon,
        color = color,
        splashColor = splashColor,
        heroTag = heroTag,
        rangeFactor = rangeFactor,
        iconColor = iconColor;

  @override
  State<StatefulWidget> createState() => _NavigateButtonState();
}

class _NavigateButtonState extends State<NavigateButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  final int time = 600;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: time));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: widget.heroTag,
      backgroundColor: widget.color,
      onPressed: () {
        showOverlay();
        Future.delayed(Duration(milliseconds: time - 300)).then((_) {
          Navigator.of(context)
              .push(FadeRouteBuilder(screen: widget.nextScreen));
        });
      },
      child: Icon(
        widget.icon,
        color: widget.iconColor,
      ),
    );
  }

  Widget _ripple() {
    final RenderBox box = context.findRenderObject();
    final Offset target = box.localToGlobal(box.size.center(Offset.zero));
    final width = box.size.width;
    final height = box.size.height;
    final left = target.dx - width / 2;
    final top = target.dy - height / 2;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final right = screenWidth - target.dx - (width / 2);
    final bottom = screenHeight - target.dy - (height / 2);
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Positioned(
            left: left - widget.rangeFactor * screenHeight * _animation.value,
            top: top - widget.rangeFactor * screenHeight * _animation.value,
            right: right - widget.rangeFactor * screenHeight * _animation.value,
            bottom:
                bottom - widget.rangeFactor * screenHeight * _animation.value,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _animation.value > 0.65
                    ? widget.splashColor.withOpacity(1 - _animation.value)
                    : widget.splashColor,
              ),
              child: Icon(
                widget.icon,
                color: widget.iconColor,
              ),
            ));
      },
    );
  }

  Future showOverlay() async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) => _ripple());
    overlayState.insert(overlayEntry);
    _animationController.forward();
    await Future.delayed(Duration(milliseconds: time)).then((_) {
      overlayEntry.remove();
    }).then((_) {
      _animationController.reset();
    });
  }
}
