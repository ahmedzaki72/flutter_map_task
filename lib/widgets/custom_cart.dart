import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/constants.dart';
import 'package:flutter_map/widgets/custom_row.dart';

class CustomCart extends StatelessWidget {
  final String name;
  final String address;
  final String images;
  final String phone;
  final double lat;
  final double long;

  const CustomCart(
      {Key key,
      this.name,
      this.address,
      this.images,
      this.phone,
      this.lat,
      this.long})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        width: size.width,
        height: size.height * 0.2,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                    ),
                    child: Image(
                      width: 110,
                      height: 120,
                      fit: BoxFit.cover,
                      image: NetworkImage(images),
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.0,
                      ),
                      Expanded(
                        child: CustomRow(
                          title: 'Name',
                          content: name,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Expanded(
                        child: CustomRow(
                          title: 'Latitude',
                          content: lat.toString(),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      CustomRow(
                        title: 'Longitude',
                        content: long.toString(),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Expanded(
                        child: CustomRow(
                          title: 'Address',
                          content: address.substring(1, 12),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Expanded(
                        child: CustomRow(
                          title: 'Phone',
                          content: phone,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ButtonTheme(
              minWidth: size.width,
              height: size.height * 0.04,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0)),
              ),
              child: RaisedButton(
                onPressed: () {
                  print('working');

                },
                child: Text('AddList'),
                color: kButtonColors,
              ),
            )
          ],
        ),
    );
  }
}
