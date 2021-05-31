import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// TODO: Lots of work to do here
class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({
    Key? key,
    @required this.image,
    @required this.tag,
  }) : super(key: key);

  final AssetImage? image;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black54,
                      ),
                    ),
                  ),
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
                  color: Colors.white60,
                  height: 60.0,
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
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Salad',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Salad is the basic and most healthy vegan recipe out there. With freshly plucked vegitables we can easily create a salad anytime anywhere. Just wash some vegies and cut them to eatable pieces',
                      // overflow: TextOverflow.ellipsis,
                      // maxLines: 3,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
