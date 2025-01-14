import 'package:flutter/material.dart';
import 'package:hiddify/gen/assets.gen.dart';
import 'package:yandex_mapkit_lite/yandex_mapkit_lite.dart';

class MapLocationPage extends StatefulWidget {
  const MapLocationPage({super.key});
  @override
  State<MapLocationPage> createState() => _MapLocationPageState();
}

class _MapLocationPageState extends State<MapLocationPage> {
  final List<MapObject> mapObjects = [
    PlacemarkMapObject(
      mapId: const MapObjectId('finland'),
      opacity: 1,
      point: const Point(latitude: 60.1699, longitude: 24.9384),
      icon: PlacemarkIcon.single(PlacemarkIconStyle(image: BitmapDescriptor.fromAssetImage(Assets.images.flags.finland.path))),
    ),
    PlacemarkMapObject(
      mapId: const MapObjectId('netherlands'),
      opacity: 1,
      point: const Point(latitude: 52.3676, longitude: 4.9041),
      icon: PlacemarkIcon.single(PlacemarkIconStyle(image: BitmapDescriptor.fromAssetImage(Assets.images.flags.netherlands.path))),
    ),
    PlacemarkMapObject(
      mapId: const MapObjectId('austria'),
      opacity: 1,
      point: const Point(latitude: 48.2082, longitude: 16.3738),
      icon: PlacemarkIcon.single(PlacemarkIconStyle(image: BitmapDescriptor.fromAssetImage(Assets.images.flags.austria.path))),
    ),
    PlacemarkMapObject(
      mapId: const MapObjectId('germany'),
      opacity: 1,
      point: const Point(latitude: 52.5200, longitude: 13.4050),
      icon: PlacemarkIcon.single(PlacemarkIconStyle(image: BitmapDescriptor.fromAssetImage(Assets.images.flags.germany.path))),
    ),
    PlacemarkMapObject(
      mapId: const MapObjectId('france'),
      opacity: 1,
      point: const Point(latitude: 48.8566, longitude: 2.3522),
      icon: PlacemarkIcon.single(PlacemarkIconStyle(image: BitmapDescriptor.fromAssetImage(Assets.images.flags.france.path))),
    ),
    PlacemarkMapObject(
      mapId: const MapObjectId('armenia'),
      opacity: 1,
      point: const Point(latitude: 40.1792, longitude: 44.4991),
      icon: PlacemarkIcon.single(PlacemarkIconStyle(image: BitmapDescriptor.fromAssetImage(Assets.images.flags.armenia.path))),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Локации'),
      ),
      body: YandexMap(
        mapObjects: mapObjects,
        onMapCreated: (YandexMapController controller) {
          controller.moveCamera(
            CameraUpdate.newCameraPosition(
              const CameraPosition(target: Point(latitude: 52.5200, longitude: 13.4050), zoom: 8),
            ),
          );
        },
      ),
    );
  }
}
