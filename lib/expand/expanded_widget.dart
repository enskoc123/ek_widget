import 'package:flutter/material.dart';

class ExpendText extends StatefulWidget {
  @override
  _ExpendTextState createState() => _ExpendTextState();

  Color? backGroundColor;

  /// başlık
  String? tittleText;

  /// içerik  metni
  String? contentText;

  ///başlık rengi
  Color? tittleColor;

  ///içerik metni rengi
  Color? contentColor;

  bool? softWrap;

  ///başlığın max satır sayısı
  int? textMaxLine;

  /// açıklama metninin maximum satır sayısı
  int? descriptionTextMaxLine;

  ///açıklama metninin altına extradan bir metin eklemenizi sağlar
  String? ikincidescriptionText;

  ///açıklama metnin altına farklı bir widget eklemenizi sağlar
  Widget? exWidget;

  ///Başlığın içinde bulunduğu konteynır ın genişliği
  double? textTittleContWidth;

  ///açıklama metninin içinde bulunduğu konteynerın genişliği
  double? TextContWidth;
  /// text e buton işlevi göstermek maksatlı on tab metodu
  var ikinciTextKomutu;

  ExpendText(
      {this.backGroundColor,
      this.tittleText,
      this.contentText,
      this.tittleColor,
      this.contentColor,
      this.softWrap,
      this.textMaxLine,
      this.descriptionTextMaxLine,
      this.exWidget,
      this.ikincidescriptionText,
      this.TextContWidth,
      this.textTittleContWidth,
      this.ikinciTextKomutu});
}

class _ExpendTextState extends State<ExpendText> {
  bool isTapped = true;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          isTapped = !isTapped;
        });
      },
      onHighlightChanged: (value) {
        setState(() {
          isExpanded = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
        height: isTapped
            ? isExpanded
                ? 65
                : 70
            : isExpanded
                ? 225
                : 230,
        width: isExpanded ? 385 : 390,
        decoration: BoxDecoration(
          color: widget.backGroundColor ?? const Color(0xff6F12E8),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: widget.backGroundColor ??
                  const Color(0xff6F12E8).withOpacity(0.5),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: isTapped
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: widget.textTittleContWidth ?? 300,
                        child: Text(
                          widget.tittleText ?? 'başlık',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w400),
                          softWrap: widget.softWrap,
                          maxLines: widget.textMaxLine,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(
                        isTapped
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        color: Colors.white,
                        size: 27,
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: isExpanded ? widget.textTittleContWidth ?? 300 :widget.textTittleContWidth ?? 300,
                        child: Text(
                          widget.tittleText ?? 'Başlık',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                          softWrap: widget.softWrap,
                          maxLines: widget.textMaxLine,
                        ),
                      ),

                      Icon(
                        isTapped
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        color: Colors.white,
                        size: 27,
                      ),


                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: isExpanded ? widget.TextContWidth?? 500 :widget.TextContWidth ??500,

                    child: Text(
                      isTapped
                          ? ''
                          : widget.contentText ??
                              'Widgets that have global keys reparent '
                                  'their subtrees when they are moved from one '
                                  'location in the tree to another location in '
                                  'the tree. In order to reparent its subtree, '
                                  'a widget must arrive at its new location in '
                                  'the tree in the same animation frame in '
                                  'which it was removed from its old location '
                                  'the tree.',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                      softWrap: widget.softWrap,
                      maxLines: widget.descriptionTextMaxLine,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      widget.ikinciTextKomutu();
                    },
                    child: Text(
                      widget.ikincidescriptionText ?? "",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),

                ],
              ),
      ),
    );
  }
}
