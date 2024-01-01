import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/toolbar.dart';
import 'package:flutter_full_course/config/app_icons.dart';
import 'package:flutter_full_course/config/app_strings.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';

class NearbyPage extends StatelessWidget {
  const NearbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Toolbar(
        title: AppStrings.nearby,
      ),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(51.509364, -0.128928),
          initialZoom: 10,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            // Plenty of other options available!
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(51.509364, -0.128928),
                width: 100,
                height: 50,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                      ),
                      child: Text(
                        AppStrings.username,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SvgPicture.asset(
                      AppIcons.icLocation,
                      colorFilter:
                          ColorFilter.mode(Colors.black, BlendMode.srcIn),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
