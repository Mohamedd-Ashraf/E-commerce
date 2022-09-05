import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/uitils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagesSlider extends StatefulWidget {
  final String image;

  const ImagesSlider({Key? key, required this.image}) : super(key: key);

  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
            itemCount: 3,
            carouselController: carouselController,
            itemBuilder: (context, index, realIndex) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.image), fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(10)),
                ),
              );
            },
            options: CarouselOptions(
                height: 500,
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlayInterval: Duration(seconds: 5),
                viewportFraction: 1,
                onPageChanged: (index, reson) {
                  setState(() {
                    currentIndex = index;
                  });
                })),
        Positioned(
            bottom: 30,
            left: 180,
            child: AnimatedSmoothIndicator(
              
              activeIndex: currentIndex,
              count: 3,
              effect: ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                // dotColor: Get.isDarkMode ? mainColor : pinkClr,
                activeDotColor:Get.isDarkMode ? pinkClr : mainColor 
              ),
            ))
      ],
    );
  }
}
