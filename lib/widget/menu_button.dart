import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuButton extends StatelessWidget {
  final String? label;
  final String imageLocation;
  final bool isLastItem;

  const MenuButton(this.imageLocation,
      {Key? key, this.label, this.isLastItem = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 0,
        right: isLastItem ? 0 : 0,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: SvgPicture.asset(
                imageLocation,
                // Jika SVG Anda tidak menampilkan dengan benar, Anda bisa mencoba mengatur parameter fit:
                // fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "$label",
            style: TextStyle(color: Colors.black, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
