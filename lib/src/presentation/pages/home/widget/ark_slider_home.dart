import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ArkSliderHome extends StatelessWidget {
  ArkSliderHome({Key? key}) : super(key: key);

  final _homeC = Get.find<ArkHomeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_homeC.isLoadingImageSlider.value) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 140,
            width: Get.width - 32,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6), color: Colors.grey),
          ),
        );
      } else {
        return Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                reverse: true,
                height: 150,
                autoPlayInterval: const Duration(seconds: 8),
                viewportFraction: 1,
                autoPlay: true,
                onPageChanged: (i, r) => _homeC.onSliderChange(i, r),
              ),
              items: List.generate(
                _homeC.sliderImage.value.data.length,
                (i) => GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: 170,
                    width: Get.size.width - 34,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: _homeC.sliderImage.value.data[i].img,
                        errorWidget: (context, url, error) {
                          return Center(
                            child: Image.asset(
                              'assets/images/arkademi-icon.png',
                              color: Colors.blue,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _homeC.sliderImage.value.data.length,
                    (index) => Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          const EdgeInsets.only(top: 10.0, left: 2.0, right: 2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: _homeC.indexSlider.value == index
                            ? Border.all(width: 0.2, color: kNewBlack2b)
                            : Border.all(width: 0.6, color: kNewBlack2b),
                        color: _homeC.indexSlider.value == index
                            ? const Color.fromRGBO(255, 255, 255, 1)
                            : const Color.fromRGBO(0, 0, 0, 0.3),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }
    });
  }
}
