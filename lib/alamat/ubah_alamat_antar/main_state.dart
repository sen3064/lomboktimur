import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';

class MainStateController extends GetxController{
  var isLoading = false.obs;
  var listSource = <SearchInfo>[].obs;
}