import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/1_1_material_classes/controller/material_classes_controller.dart';
import 'package:materials/pages/1_1_material_classes/models/search_model.dart';

import 'package:materials/pages/1_2_search/controller/search_controller.dart';
import 'package:materials/routes/app_page.dart';
import 'package:materials/services/app_global_serv.dart';
import 'package:materials/utils/logger.dart';

late SearchController c = SearchController.to;
late AppGlobalServ sGlob = AppGlobalServ.to;
late MaterialClassesController cClass = MaterialClassesController.to;

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String findText = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('search'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.1,
            child: TextField(
              autofocus: true,
              onChanged: (inputText) {
                c.findText = inputText;
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                c.searchLogicRun();
              },
              child: const Text('start compure')),
          Obx(() => Text('Find count = ${c.listFilteredData.length}')),
          Obx(() {
            return Expanded(
              child: ListView.builder(
                  itemCount: c.listFilteredData.length,
                  itemBuilder: (context, index) => itemFindText(
                        title: c.listFilteredData[index].nameMaterial,
                        subTitle: c.listFilteredData[index].nameSubClass,
                        idMaterial: c.listFilteredData[index].idMaterial,
                      )),
            );
          })
        ],
      ),
    );
  }

  Widget itemFindText(
      {required String title,
      required String subTitle,
      required String idMaterial}) {
    return ListTile(
      title: Text(title),
      onTap: () {
        sGlob.idMaterial = idMaterial;
        sGlob.nameMaterial = title;
        sGlob.nameSubMaterial = subTitle;
        Get.toNamed(Routes.materialInfo);
      },
      subtitle: Text(subTitle),
    );
  }
}
