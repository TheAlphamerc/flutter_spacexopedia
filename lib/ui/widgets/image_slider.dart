import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_spacexopedia/ui/widgets/dot_indicator.dart';

class PhotoPageView extends StatefulWidget {
  final List<String> imageList;

  const PhotoPageView({@required this.imageList});

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<PhotoPageView> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    // Return empty widget if imageList has no pictures
    if (widget.imageList == null || widget.imageList.length < 1) {
      return SizedBox();
    }

    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Stack(
        children: <Widget>[
          PageView.builder(
            controller: controller,
            itemBuilder: (context, position) {
              return InkWell(
                onTap: () {},
                child: SpacePicture(
                  imageUrl: widget.imageList[position],
                  heroTag: "${widget.imageList[position]}",
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
              );
            },
            itemCount: widget.imageList.length, // Can be null
          ),
          _controls(),
        ],
      ),
    );
  }

  Widget _controls() {
    if (widget.imageList.length == 1) {
      return SizedBox();
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 30,
        child: DotsIndicator(
          controller: controller,
          itemCount: widget.imageList.length,
          onPageSelected: (int page) {
            controller.animateToPage(
              page,
              duration: Duration(milliseconds: 750),
              curve: Curves.ease,
            );
          },
        ),
      ),
    );
  }
}

class SpacePicture extends StatelessWidget {
  final String imageUrl;
  final String heroTag;
  final BorderRadius borderRadius;
  SpacePicture(
      {@required this.imageUrl, @required this.heroTag, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Hero(
        tag: heroTag,
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(4),
          child: CachedNetworkImage(
            filterQuality: FilterQuality.low,
            fit: BoxFit.cover,
            imageUrl: imageUrl,
            fadeInCurve: Curves.easeIn,
            fadeOutCurve: Curves.easeOut,
            placeholder: (context, url) => Container(color: Color(0xffeeeeee)),
          ),
        ),
      ),
    );
  }
}
