import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/loc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/painter.dart';
//import 'package:geolocator/geolocator.dart';

// final locstreamprovider = StreamProvider<Position>(((ref) {
//   return Stream.periodic(
//     Duration(seconds: 1),((positionStream) {

//     })
//   );
// }));
AndroidSettings locationSettings = AndroidSettings(
  accuracy: LocationAccuracy.best,
  //distanceFilter: 0,
  forceLocationManager: true,
  intervalDuration: const Duration(seconds: 10),
  //(Optional) Set foreground notification config to keep the app alive
  //when going to the background
  // foregroundNotificationConfig: const ForegroundNotificationConfig(
  //   notificationText:
  //       "Example app will continue to receive your location even when you aren't using it",
  //   notificationTitle: "Running in Background",
  //   enableWakeLock: true,
  // )
);

class home extends ConsumerStatefulWidget {
  const home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _homeState();
}

class _homeState extends ConsumerState<home> {
  Position? aposition;
  List<Position>? data;
  Position? temposition;
  Position? position2;
  @override
  void initState() {
    super.initState();
    start();
  }

  void start() async {
    aposition = await ref.read(locProvider).determinePosition();
    // data = ref.watch(locProvider).positionStream as List<Position>;
    // LocationSettings locationSettings = LocationSettings(
    //   accuracy: LocationAccuracy.bestForNavigation,
    //   distanceFilter: 0,
    //  forceLocationManager: true,
    // );
    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) async {
      double distanceInMeters = Geolocator.distanceBetween(aposition!.latitude,
          aposition!.longitude, position!.latitude, position.longitude);
      print(distanceInMeters);
      print("------------------------------------------------------");
      double bearing = Geolocator.bearingBetween(aposition!.latitude,
          aposition!.longitude, position.latitude, position.longitude);
      // temposition = position;
      print(bearing);

      LinePaintPage(
          c: distanceInMeters * cos(bearing),
          d: distanceInMeters * sin(bearing));
      //   await data?.add(position!);
      // print(position == null
      //     ? 'Unknown'
      //     : '${position.latitude.toString()}, ${position.longitude.toString()}');
      aposition = position;
    });
    // while (data!.isNotEmpty) {
    //   int x = data!.length;
    //   position2 = data![x];
    //   temposition = data![x];
    //   double distanceInMeters = Geolocator.distanceBetween(
    //       temposition!.latitude,
    //       temposition!.longitude,
    //       position2!.latitude,
    //       position2!.longitude);
    //   print(distanceInMeters);
    // }

//double distanceInMeters = Geolocator.distanceBetween(position!.latitude, position!.longitude, 52.3546274, 4.8285838);
  }

  @override
  Widget build(BuildContext context) {
    // print(aposition);
    // print(data);

    return Container();
  }
}
