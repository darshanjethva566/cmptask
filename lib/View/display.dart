// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Controller/getdata.dart';
import '../Model/getdata.dart';

class UserProfile extends StatefulWidget {
  DynamicDataModel ?dataModel ;


 UserProfile({super.key, required this.dataModel});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final get = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Profile data",style: TextStyle(color: Colors.black)),
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: Get.height*0.5,
                width: Get.width,
                child: Card(
                  child: GoogleMap(
                    zoomControlsEnabled: false,
                    markers: <
                        Marker>{
                      Marker(
                        markerId: const MarkerId(
                            '1'),
                        icon: BitmapDescriptor
                            .defaultMarkerWithHue(
                            10),
                        position: LatLng(
                            widget.dataModel!.lat, widget.dataModel!.lon),
                        consumeTapEvents: false,
                        draggable: false,
                        flat: false,



                      )
                    },
                    //   myLocationEnabled: true,
                    mapType:  MapType.satellite,

                    initialCameraPosition: CameraPosition(

                      target: LatLng(
                          widget.dataModel!.lat, widget.dataModel!.lon),
                       zoom: 11.5,

                    ),

                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: Get.width*0.6,
                      child: Text("Name : ${widget.dataModel!.name.toString()}",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16))),
                  Text("Icao : ${widget.dataModel!.icao.toString()}",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16)),
                ],
              ),

              Text("City : ${widget.dataModel!.city.toString()} , State : ${widget.dataModel!.city.toString()}",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16)),
              Text("Country : ${widget.dataModel!.country.toString()} ",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16)),
              Text("Tz : ${widget.dataModel!.tz.toString()}",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16)),


            ],
          ),
        ),
      ),

    );
  }
}
