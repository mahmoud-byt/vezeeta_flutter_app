import 'dart:html';
import 'dart:ui' as ui;
import 'dart:html';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({super.key, required this.fees});
  int fees;
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  void initState() {
    _loadHTML();
    _iframeElement.style.border = "none";
    _iframeElement.style.height = "100%";
    _iframeElement.style.width = "100%";
    _iframeElement.src =
        Uri.dataFromString(_loadHTML(), mimeType: 'text/html').toString();
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );
    super.initState();
  }

  final _iframeWidget = HtmlElementView(
    key: UniqueKey(),
    viewType: 'iframeElement',
  );
  final int amount = 500;
  final IFrameElement _iframeElement = IFrameElement();
  String _loadHTML() {
    return '''
      <html>
        <body onload="document.f.submit();">
          <form id="f" name="f" method="post" action="http://localhost:8000/pay">
            <input type="hidden" name="PARAMETER" value=${widget.fees}  />
          </form>
        </body>
      </html>
    ''';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: _iframeWidget,
    ));
  }
}
