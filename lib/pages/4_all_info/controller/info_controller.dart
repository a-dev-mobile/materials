// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/pages/4_all_info/models/info_m.dart';

import 'package:materials/services/app_global_serv.dart';

late AppGlobalServ sGlob = AppGlobalServ.to;
class InfoController extends GetxController {
  static InfoController get to => Get.find();


  final _database = FirebaseDatabase.instance.reference();

  Future<DataSnapshot> getFutureDataInfo() {
    final String _pathDB = 'data_base/material_info/${sGlob.idMaterial}/';
    var data = _database.child(_pathDB).once();

    return data;
  }

  InfoModel getModelInfo(AsyncSnapshot<DataSnapshot> snapshot) {
    InfoModel model = InfoModel.fromJson(
        Map<String, dynamic>.from(snapshot.data!.value));

    return model;
  }
}
