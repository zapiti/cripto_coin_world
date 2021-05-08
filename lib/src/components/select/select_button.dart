import 'package:auto_size_text/auto_size_text.dart';
import 'package:crypto_app/utils/theme/app_theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SelectButton extends StatefulWidget {
  final List<Map<String, String>> listItens;
  final Function(Map<String, String>) tapIndex;
  final Map<String, String> initialItem;

  SelectButton({
    this.listItens,
    this.initialItem,
    this.tapIndex,
  });

  @override
  _SelectButtonState createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton>
    with SingleTickerProviderStateMixin {
  Map<String, String> index;

  @override
  void initState() {
    super.initState();
    index = widget.initialItem;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
        // key:  widget.key,
        child: Row(
      children: widget.listItens
          .map<Widget>((e) => Expanded(
              child: KeyedSubtree(
                  // key:  (widget.keys ?? []).isEmpty ? null: widget.keys[e.key],
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: ElevatedButton(
                        //
                        style: ElevatedButton.styleFrom(
                            primary: index == e
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                side: BorderSide(
                                    color: index == e
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context).primaryColor,
                                    width: 1))),
                        onPressed: () {
                          if (widget.tapIndex != null) {
                            setState(() {
                              index = e;
                              widget.tapIndex(e);
                            });
                          }
                        },
                        child: Container(
                          height: 45,
                          child: Center(
                            child: AutoSizeText(
                              e.keys.first,
                              maxLines: 1,
                              minFontSize: 12,
                              maxFontSize: 16,
                              textAlign: TextAlign.center,
                              style: AppThemeUtils.normalSize(
                                color: index == e
                                    ? Colors.white
                                    : Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      )))))
          .toList(),
    ));
  }
}
