import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:redacted/redacted.dart';
import 'package:day_today/Components/cNews_preview.dart';

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    body: reductedWidget(context)
        .redacted(context: context, redact: true,
      configuration: RedactedConfiguration(
        //default
      ),),
    );
  }
}



