import 'package:flutter/material.dart';

class BouncingButton extends StatefulWidget {

  final Function onTap;
  final Widget child;

  const BouncingButton({
    Key key,
    this.onTap,
    this.child,
  }): super(key:key);

  @override
  _BouncingButtonState createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton> with SingleTickerProviderStateMixin{
  
  AnimationController _controller;
  double _scale;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
}
  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds:200),
      lowerBound: 0.0,
      upperBound:  0.1
    )..addListener(() {
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
      child: Transform.scale(
        scale: _scale,
        child: widget.child,          
      ),
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTap: widget.onTap        
  );
  }
}