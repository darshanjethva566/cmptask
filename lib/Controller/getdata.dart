import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ApiService/getdata.dart';
import '../Model/getdata.dart';

class DataController extends GetxController {
  final DataService _dataService = DataService();
  final RxMap<String, DynamicDataModel> data = <String, DynamicDataModel>{}.obs;
 void checkdataOrnot()async{
   final prefs = await SharedPreferences.getInstance();
   if(prefs.getString('my_json_data')!=null){
    // addData(prefs.getString('my_json_data'));
     Map<String, dynamic> jsonData = jsonDecode(prefs.getString('my_json_data').toString());
     print(jsonData);
     addData(jsonData);
    // print(jsonDecode(prefs.getString('my_json_data').toString()).runtimeType);
   }
   else{
     fetchData();
     print("me nopt here");

   }
 }
  @override
  void onInit() {
    checkdataOrnot();
    super.onInit();
  }
  addData(Map<String, dynamic> response){
    data.value = Map<String, DynamicDataModel>.fromEntries(
      response.entries.map((entry) => MapEntry(

        entry.key,
        DynamicDataModel(key: entry.key, icao: entry.value['icao'],
            name: entry.value['name'],elevation: entry.value['elevation'],
            city: entry.value['city'],country: entry.value['country'],
            iata:  entry.value['iata'], lat: entry.value['lat'],
            lon: entry.value['lon'],state: entry.value['state'],
            tz: entry.value['tz']

        ),
      )),
    );
  }
  Future<void> fetchData() async {
    try {
      final response = await _dataService.fetchData();
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('my_json_data', jsonEncode(response));
      print("respo datatype:${response.runtimeType}");
      await addData(response);
    } catch (e) {
      print("jiiii:${e}");
      // Handle errors
    }
  }
}
