import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/constants.dart';
import 'package:flutter_map/modals/pindata_modal.dart';
import 'package:flutter_map/providers/info_provider.dart';
import 'dart:collection';
import 'package:flutter_map/providers/offices_Provider.dart';
import 'package:flutter_map/widgets/custom_cart.dart';
import 'package:flutter_map/widgets/custom_row.dart';
import 'package:flutter_map/widgets/result_container.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController myController;
  var myMarkers = HashSet<Marker>();
  final double _infoWindowWidth = 250;
  final double _markerOffset = 170;
  BitmapDescriptor customMarker;
  LatLng _latlng = LatLng(56.172249, 10.187372);

  void _onMapCreate(GoogleMapController controller) {
    myController = controller;
  }

  getCustomMarker() async {
    customMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'assets/images/markers.png');
  }

  @override
  void initState() {
    super.initState();
    getCustomMarker();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final offices1 =
    Provider.of<OfficesProvider>(context, listen: false).fetchOffices();
    final offices = Provider.of<OfficesProvider>(context).officesList;
    final providerObject = Provider.of<InfoWindowModel>(context, listen: false);
    // print(offices.length);
    for (var office in offices) {
      // print(office.long);
      myMarkers.add(
        Marker(
          markerId: MarkerId(office.id),
          position: LatLng(office.lat, office.long),
          // infoWindow: InfoWindow(title: office.name, snippet: office.address),
          onTap: () {
            providerObject.updateInfoWindow(
              context,
              myController,
              LatLng(office.lat, office.long),
              _infoWindowWidth,
              _markerOffset,
            );
            providerObject.updateUser(office);
            providerObject.updateVisibility(true);
            providerObject.rebuildInfoWindow();
          },
          icon: customMarker,
        ),
      );
    }
    return Scaffold(
      body: Container(
        child: Consumer<InfoWindowModel>(builder: (context, model, child) {
          return Stack(
            children: [
              Positioned(
                child: GoogleMap(
                  onTap: (position) {
                    if (providerObject.showInfoWindow) {
                      providerObject.updateVisibility(false);
                      providerObject.rebuildInfoWindow();
                    }
                  },
                  onCameraMove: (position) {
                    if (providerObject.office != null) {
                      providerObject.updateInfoWindow(
                        context,
                        myController,
                        LatLng(providerObject.office.lat,
                            providerObject.office.long),
                        _infoWindowWidth,
                        _markerOffset,
                      );
                      providerObject.rebuildInfoWindow();
                    }
                  },
                  initialCameraPosition: CameraPosition(
                    target: _latlng,
                    zoom: 6.0,
                  ),
                  onMapCreated: _onMapCreate,
                  markers: myMarkers,
                ),
              ),
              Positioned(
               left: 0,
                right: 0,
                child: Visibility(
                  visible: providerObject.showInfoWindow,
                  child: (providerObject.office == null ||
                      !providerObject.showInfoWindow)
                      ? Container()
                      : Container(
                    margin: EdgeInsets.only(
                      top: providerObject.topMargin,
                    ),
                    child: CustomCart(
                      name: providerObject.office.name,
                      phone: providerObject.office.phone,
                      address: providerObject.office.address,
                      lat: providerObject.office.lat,
                      long: providerObject.office.long,
                      images: providerObject.office.image,
                    ),
                  ),
                ),
              ),
              // ResultContainer(),
            ],
          );
        }),
      ),
    );
  }
}
