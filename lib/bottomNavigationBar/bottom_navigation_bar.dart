import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  IconData? icon1;
  IconData? icon2;
  IconData? icon3;
  IconData? icon4;
  Color? contColor;
  Color? iconColor;
  Color? animColor;
  int? itemCount;

  BottomNavBar(
      {required this.icon1,
      required this.icon2,
      required this.icon3,
      required this.icon4,
      this.itemCount,
      this.contColor,
      this.iconColor,
      this.animColor});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.icon1 != null) {
      listOfIcons.add(widget.icon1!);
    }
    if (widget.icon2 != null) {
      listOfIcons.add(widget.icon2!);
    }
    if (widget.icon3 != null) {
      listOfIcons.add(widget.icon3!);
    }
    if (widget.icon4 != null) {
      listOfIcons.add(widget.icon4!);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(20),
      height: size.width * .155,
      decoration: BoxDecoration(
        color: widget.contColor ?? Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 30,
            offset: Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView.builder(
        itemCount: widget.itemCount ?? 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: size.width * .024),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(
              () {
                if(index == 0){
                  print("1");
                }if (index == 1){
                  print("2");
                }if(index == 3){
                  print("3");
                }else{
                  print("4");
                }
                currentIndex = index;
              },
            );
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 1500),
                curve: Curves.fastLinearToSlowEaseIn,
                margin: EdgeInsets.only(
                  bottom: index == currentIndex ? 0 : size.width * .029,
                  right: size.width * .0422,
                  left: size.width * .0422,
                ),
                width: size.width * .128,
                height: index == currentIndex ? size.width * .014 : 0,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
              ),
              Icon(
                listOfIcons[index],
                size: size.width * .076,
                color:
                    index == currentIndex ? Colors.blueAccent : Colors.black38,
              ),
              SizedBox(height: size.width * .03),
            ],
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [];
}
