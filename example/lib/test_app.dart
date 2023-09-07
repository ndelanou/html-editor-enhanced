import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      home: TestScreen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final tfFocusNode = FocusNode();
  final tfController = TextEditingController();
  
  final controller = HtmlEditorController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(width: 32),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      width: 200,
                      child: TextField(
                        controller: tfController,
                        autofocus: true,
                        focusNode: tfFocusNode,
                      ),
                    ),
                  ),
                  SizedBox(width: 32),
                ],
              ),
              flex: 1,
            ),
            Expanded(
              child: HtmlEditor(
                controller: controller,
                callbacks: Callbacks(
                  onInit: () {
                    controller.setFullScreen();
                  },
                  onFocus: () {

                    controller.setFocus();
                  },
                ),
                htmlEditorOptions: HtmlEditorOptions(),
                htmlToolbarOptions: HtmlToolbarOptions(
                  toolbarPosition: ToolbarPosition.belowEditor,
                ),
              ),
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
