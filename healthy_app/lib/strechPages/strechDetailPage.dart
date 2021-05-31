import 'package:flutter/material.dart';

// TODO: Lots of work to do here
class StrechDetailPage extends StatelessWidget {
  const StrechDetailPage({
    Key? key,
    @required this.image,
    @required this.tag,
  }) : super(key: key);

  final AssetImage? image;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 300,
                    child: Hero(
                      tag: tag!,
                      child: Image(
                        image: image!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 60.0,
                    color: Colors.white60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
