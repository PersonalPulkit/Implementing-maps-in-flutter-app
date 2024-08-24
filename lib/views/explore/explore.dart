import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mappls_gl/mappls_gl.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final _searchField = TextEditingController();
  String? searchText;
  late MapplsMapController mapController;
  bool isMapLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MapplsAccountManager.setMapSDKKey("4b71411c5e7f7fa4e63ef851ac839ed0");
    MapplsAccountManager.setRestAPIKey("4b71411c5e7f7fa4e63ef851ac839ed0");
    MapplsAccountManager.setAtlasClientId(
        "96dHZVzsAuuHibt3T64waUgOaWEN8UdxcBt5Mx46maMU5AZMT8kp78vYfD80_s-X5gOX0FfI7_fIZaeEePDXuA==");
    MapplsAccountManager.setAtlasClientSecret(
        "lrFxI-iSEg-9JDgZ7q8rb17chSlz5N7Qum5sKYJWyWiscPG_05M0dV1sba8nduhZn0WgXI7_m6HBvwQZOoX7p-Wtc7xbyxd2");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchField.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(_searchField);
    }
    return Scaffold(
      appBar: AppBar(
        leading: Center(child: Text('Explore')),
        title: TextField(
          controller: _searchField,
          onChanged: (text) {
            setState(() {
              searchText = text;
            });
          },
          decoration: InputDecoration(
            suffixIcon: _searchField.text != ''
                ? IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        searchText = null;
                        _searchField.clear();
                      });
                    },
                  )
                : IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
            hintText: 'Search Area',
            filled: true,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: MapplsMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(26.9124, 75.7873),
                zoom: 6,
              ),
              myLocationEnabled: true,
              myLocationTrackingMode: MyLocationTrackingMode.Tracking,
              onUserLocationUpdated: (location) {
                print('onUserLocationUpdated ${location.position.toJson()}');
              },
              onMapCreated: (MapplsMapController controller) {
                mapController = controller;
                setState(() {
                  isMapLoaded = true;
                });
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Text('data'),
          )
        ],
      ),
    );
  }
}
