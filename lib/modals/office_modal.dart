class Office {
  final String address;
  final String id;
  final String image;
  final double lat;
  final double long;
  final String name;
  final String phone;
  final String region;

  Office({
    this.address,
    this.id,
    this.image,
    this.lat,
    this.long,
    this.name,
    this.phone,
    this.region,
  });

 factory Office.fromJson(Map<String, dynamic> jsonData) {
   return Office(
      id: jsonData['id'],
      address: jsonData['address'],
      image: jsonData['image'],
      lat: jsonData['lat'],
      long: jsonData['lng'],
      name: jsonData['name'],
      phone: jsonData['phone'],
      region: jsonData['region'],
   );
 }

 Map<String, dynamic > toJson() {
   return {
     'id' : id,
     'address' : address,
     'image' : image,
     'lat' : lat,
     'long' : long,
     'name' : name,
     'phone' : phone,
     'region' : region,
   };
 }
}
