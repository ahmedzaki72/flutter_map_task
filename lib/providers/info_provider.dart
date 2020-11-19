import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_map/modals/office_modal.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class InfoWindowModel extends ChangeNotifier {
  bool _showInfoWindow = false;
  bool _tempHidden = false;
  Office  _office;
  double _leftMargin;
  double _topMargin;

  void rebuildInfoWindow() {
    notifyListeners();
  }

  void updateUser(Office office) {
    _office = office;
  }

  void updateVisibility(bool visibility) {
    _showInfoWindow = visibility;
  }

  void updateInfoWindow(
      BuildContext context,
      GoogleMapController controller,
      LatLng location,
      double infoWindowWidth,
      double markerOffset,
      ) async {
    ScreenCoordinate screenCoordinate =
    await controller.getScreenCoordinate(location);
    double devicePixelRatio =
    Platform.isAndroid ? MediaQuery.of(context).devicePixelRatio : 1.0;
    double left = (screenCoordinate.x.toDouble() / devicePixelRatio) -
        (infoWindowWidth / 2);
    double top =
        (screenCoordinate.y.toDouble() / devicePixelRatio) - markerOffset;
    if (left < 0 || top < 0) {
      _tempHidden = true;
    } else {
      _tempHidden = false;
      _leftMargin = left;
      _topMargin = top;
    }
  }

  bool get showInfoWindow =>
      (_showInfoWindow == true && _tempHidden == false) ? true : false;

  double get leftMargin => _leftMargin;

  double get topMargin => _topMargin;

  Office get office => _office;
}