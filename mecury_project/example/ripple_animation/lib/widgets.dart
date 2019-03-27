import 'package:flutter/material.dart';
import 'route.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstScreen'),
      ),
      body: Center(
        child: NavigateButton(
          nextScreen: SecondScreen(),
          color: Colors.grey,
          splashColor: Colors.grey,
        ),
      ),
      floatingActionButton: NavigateButton(
        nextScreen: SecondScreen(),
        color: Colors.blue,
        splashColor: Colors.blueAccent,
        heroTag: 'blue',
        rangeFactor: 8,
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondScreen'),
      ),
    );
  }
}

class NavigateButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final Color splashColor;
  final Object heroTag;
  final Widget nextScreen;
  final int rangeFactor;

  NavigateButton(
      {IconData icon = Icons.navigate_next,
      Color color = Colors.blue,
      Color splashColor = Colors.white,
      Object heroTag = '',
      int rangeFactor = 10,
      @required this.nextScreen})
      : icon = icon,
        color = color,
        splashColor = splashColor,
        heroTag = heroTag,
        rangeFactor = rangeFactor;

  @override
  State<StatefulWidget> createState() => _NavigateButtonState();
}

class _NavigateButtonState extends State<NavigateButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
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
        showOverlay()
          ..then((_) {
            Navigator.of(context)
                .push(FadeRouteBuilder(screen: widget.nextScreen));
          });
      },
      child: Icon(widget.icon),
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
    print(screenHeight);
    final right = screenWidth - target.dx - (width / 2);
    final bottom = screenHeight - target.dy - (height / 2);
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Positioned(
            left: left - widget.rangeFactor * screenWidth * _animation.value,
            top: top - widget.rangeFactor * screenHeight * _animation.value,
            right: right - widget.rangeFactor * screenWidth * _animation.value,
            bottom:
                bottom - widget.rangeFactor * screenHeight * _animation.value,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.splashColor,
              ),
              child: Icon(
                widget.icon,
                color: Colors.white,
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
    await Future.delayed(Duration(milliseconds: 500)).then((_) {
      overlayEntry.remove();
    }).then((_) {
      _animationController.reset();
    });
  }
}
