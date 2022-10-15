import 'package:ark_module_regular/src/domain/entities/category_entity.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:ark_module_setup/utils/app_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArkBannerCategory extends StatelessWidget {
  const ArkBannerCategory({
    Key? key,
    required this.listCategory,
    required this.isLoading,
  }) : super(key: key);

  final List<CategoryDataEntity> listCategory;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Kategori Terpopular',
            style: AppStyleText.styleMontserrat(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        if (isLoading)
          SizedBox(
            height: 220,
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                8,
                (i) => AppShimmer.loadImage(70, 70),
              ),
            ),
          ),
        if (!isLoading)
          SizedBox(
            height: 220,
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                listCategory.length,
                (i) => GestureDetector(
                  onTap: () async {},
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: listCategory[i].img,
                          height: 50,
                          width: 50,
                          placeholder: (_, __) => Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          listCategory[i].name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
