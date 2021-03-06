import 'package:flutter/material.dart';

import '../provider/destination.dart';
import '../models/hotel.dart';

class DestinationCardImage extends StatefulWidget {
  final Destination d;
  DestinationCardImage(this.d);

  @override
  State<DestinationCardImage> createState() => _DestinationCardImageState();
}

class _DestinationCardImageState extends State<DestinationCardImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Image.network(
            widget.d.imgUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            icon: Icon(
              widget.d.isFavourite
                  ? Icons.bookmark
                  : Icons.bookmark_border_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                widget.d.toggleFavouriteButton();
              });
            },
          ),
        ),
      ],
    );
  }
}
