import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'widget/ark_class_search_card.dart';
import 'widget/ark_class_search_result_card.dart';

class ArkSearchPage extends StatelessWidget {
  ArkSearchPage({Key? key}) : super(key: key);

  final _searchC = Get.find<ArkSearchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: kPrimaryColor,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 60,
                  padding: const EdgeInsets.only(
                      left: 18, right: 18, top: 15, bottom: 5),
                  child: TextField(
                    onChanged: _searchC.onChangeSeacrh,
                    onEditingComplete: () => _searchC.onSearchComplete(),
                    decoration: AppStyleTextfield.searchBarDecoration(),
                    controller: _searchC.txSearch,
                  ),
                ),
                Obx(() {
                  if (_searchC.isHaveQuery.value) {
                    return Positioned(
                      right: 15,
                      top: 10,
                      child: IconButton(
                        color: kNewBlack3,
                        icon: const Icon(FontAwesomeIcons.xmark),
                        onPressed: () => _searchC.clearSearchText(),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                })
              ],
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
      body: SafeArea(child: Obx(() {
        if (_searchC.isSearched.value) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              color: Colors.white,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 15),
                    child: Text(
                      '${_searchC.listNameSearch.length} hasil pencarian',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Column(children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: _searchC.listNameSearch.length,
                      itemBuilder: (context, i) {
                        return ArkClassSearchResultCard(
                          course: _searchC.listNameSearch[i],
                        );
                      },
                    ),
                    // _dC.moreCourse.value == true
                    //     ? Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: const [
                    //           SizedBox(
                    //             height: 10,
                    //             width: 10,
                    //             child: CircularProgressIndicator(
                    //               strokeWidth: 2,
                    //             ),
                    //           ),
                    //           SizedBox(width: 5),
                    //           Text('Memuat...'),
                    //         ],
                    //       )
                    //     : Container()
                  ]),
                ],
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
            // controller: _controller,
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _searchC.histories.isEmpty
                          ? const SizedBox()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    'Terakhir dicari',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15),
                                  ),
                                ),
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 7,
                                  children: List.generate(
                                    _searchC.histories.length > 4
                                        ? 4
                                        : _searchC.histories.length,
                                    (i) => Container(
                                      decoration: BoxDecoration(
                                          color: kNewBlack5b,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 4,
                                        horizontal: 12,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            child: GestureDetector(
                                              onTap: () =>
                                                  _searchC.onTapLatestSearched(
                                                _searchC.histories[i],
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 2.0),
                                                child: Text(
                                                  _searchC.histories[i],
                                                  style: const TextStyle(
                                                      color: kNewBlack2a,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                _searchC.histories[i].length >
                                                        18
                                                    ? 4
                                                    : 16,
                                          ),
                                          InkWell(
                                            onTap: () => _searchC
                                                .onRemoveLatestSearched(i),
                                            child: const Icon(
                                              FontAwesomeIcons.xmark,
                                              size: 12,
                                              color: kNewBlack2a,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: _searchC.histories.isEmpty ? 0 : 20,
                            bottom: 15),
                        child: const Text(
                          'Pencarian Populer',
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 15),
                        ),
                      ),
                      Obx(
                        () => Wrap(
                          spacing: 10,
                          runSpacing: 7,
                          children: List.generate(
                            _searchC.categories.length,
                            (i) => GestureDetector(
                              onTap: () {
                                // _dC.fetchListOfCategories(
                                //     _dC.listNameCategory.value.data![i].id!,
                                //     0,
                                //     8);
                                // Get.to(
                                //   () => CategoryResultPage(
                                //       _dC.listNameCategory.value.data![i]
                                //           .name!,
                                //       _dC.listNameCategory.value.data![i].id
                                //           .toString(),
                                //       index: i),
                                // );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: kPrimaryBlue5,
                                    borderRadius: BorderRadius.circular(12)),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 12),
                                height: 30,
                                child: Text(
                                  _searchC.categories[i].name,
                                  style: const TextStyle(
                                      color: kPrimaryColorNew,
                                      fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 15),
                        child: Text(
                          'Rekomendasi kelas',
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 15),
                        ),
                      ),
                      Obx(
                        () => Column(
                          children: List.generate(
                            _searchC.recomendations.length > 3
                                ? 3
                                : _searchC.recomendations.length,
                            (i) => ArkClassSearchCard(
                              course: _searchC.recomendations[i],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(() {
                  if (_searchC.isHaveQuery.value) {
                    return Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          _searchC.listNameSearch.length,
                          (index) => GestureDetector(
                            onTap: () => _searchC.onTapNameSearch(
                              _searchC.listNameSearch[index].course,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 18),
                              child: Text(
                                _searchC.listNameSearch[index].course.name,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
              ],
            ),
          );
        }
      })),
    );
  }
}
