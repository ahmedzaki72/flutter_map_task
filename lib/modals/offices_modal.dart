

class OfficesList {
  final List<dynamic> offices;
  OfficesList({this.offices});

  factory OfficesList.fromJson(Map<String, dynamic> jsonData) {
    return OfficesList(
      offices: jsonData['offices'],
    );
  }

}