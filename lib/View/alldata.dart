// ignore_for_file: invalid_use_of_protected_member, duplicate_ignore

import 'package:cmptask/View/display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/getdata.dart';

class AllData extends StatefulWidget {
  const AllData({Key? key}) : super(key: key);

  @override
  State<AllData> createState() => _AllDataState();
}

class _AllDataState extends State<AllData> {

  final  dataController = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Users data",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
      ),
      body:Obx(() {
        return dataController.data.isEmpty?
        loaDer():
        ListView.builder(
          shrinkWrap: true,
          itemCount: dataController.data.length,
          itemBuilder: (context, index) {
            final key = dataController.data.keys.elementAt(index);
            final item = dataController.data;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
              child: ElevatedButton(
                
                style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.deepPurple),elevation: MaterialStateProperty.all(10),backgroundColor: MaterialStateProperty.all(Colors.black),padding: MaterialStateProperty.all(EdgeInsets.zero),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  // print(item.value[key].runtimeType);

                  Get.to(UserProfile( dataModel: item.value[key]),fullscreenDialog: true,duration: const Duration(seconds: 1));

                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: Get.width*0.45,
                              child: Text(overflow: TextOverflow.ellipsis,softWrap: true,"Name : ${item.value[key]!.name.toString()}",style: const TextStyle(color: Colors.white))),
                          SizedBox(
                              width: Get.width*0.22,
                              child: Text(overflow: TextOverflow.ellipsis,"Icao : ${item.value[key]!.icao.toString()}",style: const TextStyle(color: Colors.white)))
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Get.width*0.6,
                            child: Text(overflow: TextOverflow.ellipsis,softWrap: true,"City : ${item.value[key]!.city.toString()} , State : ${item.value[key]!.state.toString()}, "  ,style: const TextStyle(color:  Colors.white)),
                          ),

                          SizedBox(
                                width: Get.width*0.22,

                              child: Text("Country : ${item.value[key]!.country.toString()}",style: const TextStyle(color:Colors.white)))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );

  }

  Center loaDer() {
    return const Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Colors.black),
          SizedBox(height: 5,),
          Text("Please wait for a Moment")
        ],
      ),);
  }
}
