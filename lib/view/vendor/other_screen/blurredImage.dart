import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredImage extends StatefulWidget {
  @override
  _BlurredImageState createState() => _BlurredImageState();
}

class _BlurredImageState extends State<BlurredImage> {
  Offset? blurredSpot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTapDown: (TapDownDetails details) {
          setState(() {
            blurredSpot = details.localPosition;
          });
        },
        onTapUp: (TapUpDetails details) {
          setState(() {
            blurredSpot = null;
          });
        },
        child: Stack(
          children: [
            Image.network(
              'https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            if (blurredSpot != null)
              Positioned(
                left: blurredSpot!.dx - 50,
                top: blurredSpot!.dy - 50,
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
