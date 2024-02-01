import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final _pageViewController = PageController();
  double currentPage = 0.0;
  var slides = [
    {
      "header": "Easy access",
      "description": "Lorem ipsum dolor",
      "image": "assets/images/1.png"
    },
    {
      "header": "Notifications",
      "description": "Lorem ipsum dolow",
      "image": "assets/images/2.png"
    }
  ]
      .map((item) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Image.asset(
                  item['image']!,
                  fit: BoxFit.fitWidth,
                  width: 220.0,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: <Widget>[
                      Text(item['header']!,
                          style: const TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w300,
                              color: Color(0XFF3F3D56),
                              height: 2.0)),
                      Text(
                        item['description']!,
                        style: const TextStyle(
                            color: Colors.grey,
                            letterSpacing: 1.2,
                            fontSize: 16.0,
                            height: 1.3),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              )
            ],
          )))
      .toList();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageViewController,
      itemCount: slides.length,
      itemBuilder: (BuildContext context, int index) {
        _pageViewController.addListener(() {
          setState(() {
            currentPage = _pageViewController.page!;
          });
        });
        return slides[index];
      },
    );
  }
}
