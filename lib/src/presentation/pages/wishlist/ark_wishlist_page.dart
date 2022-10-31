import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:ark_module_regular/src/presentation/pages/my_class/widget/ark_empty_course.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:ark_module_setup/utils/app_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ArkWishlistPage extends StatelessWidget {
  ArkWishlistPage({Key? key}) : super(key: key);

  final _wlC = Get.find<ArkWishlistController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: false,
        title: const Text(
          'Wishlist',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: Obx(
        () {
          if (_wlC.isLoading.value) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: AppShimmer.loadBannerBlog(),
            );
          }

          if (_wlC.wishlist.isNotEmpty) {
            return ListView(
              children: List.generate(_wlC.wishlist.length, (index) {
                final data = _wlC.wishlist[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lembaga: ${data.course.instructor.name}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(
                                0xFF94969B,
                              ),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: CachedNetworkImage(
                                  placeholder: (context, url) {
                                    return Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        color: Colors.grey,
                                        height: 82,
                                      ),
                                    );
                                  },
                                  fit: BoxFit.cover,
                                  height: 60,
                                  width: 60,
                                  imageUrl: data.course.featuredImage,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: 60,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.course.name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      data.course.salePrice == '0' ||
                                              data.course.salePrice.isEmpty
                                          ? Text(
                                              currencyFormatter.format(
                                                  int.parse(data
                                                      .course.regularPrice)),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          : Row(
                                              children: [
                                                Text(
                                                  currencyFormatter.format(
                                                      int.parse(data
                                                          .course.salePrice)),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 4),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 2,
                                                      horizontal: 4),
                                                  decoration: BoxDecoration(
                                                      color: kPrimaryRed4,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                  child: Text(
                                                    "${data.course.discount.round()} %",
                                                    style: const TextStyle(
                                                      fontSize: 10.5,
                                                      color: kPrimaryRed2,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  currencyFormatter.format(
                                                    int.parse(data
                                                        .course.regularPrice),
                                                  ),
                                                  style: const TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    fontWeight: FontWeight.w500,
                                                    color: kNewBlack3,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ],
                                            )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () =>
                                      _wlC.deleteWishlist(data.course.id),
                                  icon: const Icon(
                                    Icons.delete_outline_rounded,
                                    color: Colors.grey,
                                    size: 28,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    // await _wlC.fnChangeLoadingCheckout(true);
                                    // await _lCC.fetchDetailClass(
                                    //     int.parse(data.courseId.toString()));
                                    // // await _cC.fetchDetailClass(int.parse(
                                    // //     data.courseId.toString()));
                                    // await _wlC.fnChangeLoadingCheckout(false);
                                    // Get.to(() => const CheckoutPage());
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 120,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF0977BE),
                                          Color(0xFF159FE0),
                                        ],
                                      ),
                                    ),
                                    child: const Text(
                                      "Beli Sekarang",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 2,
                      color: Colors.grey.shade200,
                    )
                  ],
                );
              }),
            );
          }
          return ArkEmptyCourse(
            onTap: () {},
            title: "Anda tidak memiliki kelas dalam wishlist anda",
            isHaveButton: false,
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        height: 90,
        width: double.infinity,
        child: InkWell(
          onTap: () => Get.toNamed(AppRouteName.search),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xFFFF8017),
            ),
            width: Get.width / 1.15,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Tambah Kelas",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
