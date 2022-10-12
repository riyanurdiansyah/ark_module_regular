import 'package:ark_module_regular/src/domain/entities/category_entity.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ArkCategoryPage extends StatelessWidget {
  const ArkCategoryPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kCanvasColor,
        titleSpacing: 0,
        elevation: 1,
        automaticallyImplyLeading: true,
        leadingWidth: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            'Kategori',
            style: TextStyle(
                fontSize: 15, color: kNewBlack2a, fontWeight: FontWeight.bold),
          ),
        ),
        actionsIconTheme: const IconThemeData(color: kNewBlack2a),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.xmark, size: 20),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      body: ListView(
        children: List.generate(
          category.data.length,
          (i) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (i == 0)
                const SizedBox(
                  height: 8,
                ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 15, top: 8, right: 15, bottom: 8),
                  child: Row(children: [
                    Image.network(category.data[i].img, width: 22, height: 22),
                    const SizedBox(width: 15),
                    Text(category.data[i].name),
                    if (category.data[i].id == 2778)
                      const SizedBox(
                        width: 10,
                      ),
                    if (category.data[i].id == 2778)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF4DD2F9),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'Baru',
                          style: AppStyleText.styleMontserrat(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      )
                  ]),
                ),
              ),
              const Divider(
                color: kNewBlack4,
                thickness: 0.7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
