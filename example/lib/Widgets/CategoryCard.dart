import 'package:example/Utils/colors.dart';
import 'package:example/Utils/common.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Color color;
  final Function()? press;
  const CategoryCard({
    Key? key,
    required this.svgSrc,
    required this.title,
    required this.press,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
     //   border: Border.all(width: 0),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            spreadRadius: -15,
            color: Colors.grey,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white,
            onTap: press!,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: CustomStyle.cardBoxDecoration,
                    child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Image.asset(svgSrc),
                        )),
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    width: double.infinity,
                    color: primaryColor.withOpacity(0.4),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
