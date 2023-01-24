import 'package:flutter/material.dart';

class ExpendLetterWidget extends StatefulWidget {
  @override
  _ExpendLetterWidgetState createState() => _ExpendLetterWidgetState();
/// kutunun içinden çıkan mektup metninin bulunduğu alanın arkaplan rengi
  Color? letterColor;

  ///Metinsel içerik yazısı
  String? text;
  ///Başlık
  String? tittle;
  /// icon widget şeklinde oluşturulmuştur.
  /// Icon(Icons.icon) şeklinde girilmelidir
  Widget? icon;
  ///İconun bulunduğu kutunun rengi
  Color? boxColor;
  /// Yazo rengi
  Color? textColor;
  ///Başlık rengi
  Color? tittleColor;

  ExpendLetterWidget(
      {this.letterColor,

      this.tittle,
      this.text,
     this.icon,
      this.boxColor,
      this.textColor,
      this.tittleColor});
}

class _ExpendLetterWidgetState extends State<ExpendLetterWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimCard(
      color: widget.letterColor ?? const Color(0xffFF6594),
      content:  '',
      numEng:  '',
      num:  '',
      text: widget.text,
      tittle: widget.tittle,
      icon: widget.icon,
      boxColor: widget.boxColor,
      textColor: widget.textColor,
      tittleColor: widget.tittleColor,
    );
  }
}

class AnimCard extends StatefulWidget {
  final Color color;
  final String num;
  final String numEng;
  final String content;
  String? text;
  String? tittle;
  Widget? icon;
  Color? boxColor;
  Color? textColor;
  Color? tittleColor;

  AnimCard({
    required this.color,
    required this.num,
    required this.numEng,
    required this.content,
    this.text,
    this.tittle,
    this.icon,
    this.boxColor,
    required this.tittleColor,
    required this.textColor,
  });

  @override
  _AnimCardState createState() => _AnimCardState();
}

class _AnimCardState extends State<AnimCard> {
  var padding = 150.0;
  var bottomPadding = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPadding(
            padding: EdgeInsets.only(top: padding, bottom: bottomPadding),
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
            child: Container(
              child: CardItem(
                color: widget.color,
                num: "",
                numEng: "",
                content: "",
                text: widget.text,
                tittle: widget.tittle,
                textColor: widget.textColor,
                tittleColor: widget.tittleColor,
                onTap: () {
                  setState(() {
                    padding = padding == 0 ? 150.0 : 0.0;
                    bottomPadding = bottomPadding == 0 ? 150 : 0.0;
                  });
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(right: 20, left: 20, top: 200),
              height: 180,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2), blurRadius: 30)
                ],
                color: widget.boxColor ?? Colors.grey.shade200.withOpacity(1.0),
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: Center(
                  child: widget.icon ??
                      Icon(Icons.favorite,
                          color: widget.color.withOpacity(1.0), size: 70)),
            ),
          ),
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final Color? color;
  final String? num;
  final String? numEng;
  final String? content;
  final String? text;
  final String? tittle;
  final onTap;
  final Color? textColor;
  final Color? tittleColor;

  const CardItem({
    required this.color,
    required this.num,
    required this.numEng,
    required this.content,
    this.tittle,
    this.text,
    this.onTap,
    this.textColor,
    this.tittleColor,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        height: 220,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: const Color(0xffFF6594).withOpacity(0.2),
                blurRadius: 25),
          ],
          color: color!.withOpacity(1.0),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                tittle ?? "Başlık",
                style: TextStyle(
                    color: tittleColor ?? Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                text ??
                    'Widgets that have global keys reparent their subtrees when they are moved from one location in the tree to another location in the tree. In order to reparent its subtree, a widget must arrive at its new location in the tree in the same animation frame in which it was removed from its old location the tree.',
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
