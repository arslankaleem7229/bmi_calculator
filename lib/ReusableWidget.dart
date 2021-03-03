import 'package:flutter/material.dart';

import 'constlabels.dart';

class ReusableWidget extends StatelessWidget {
  ReusableWidget(this.type, this.label);

  final IconData type;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          type,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          label,
          style: kLabelText,
        ),
      ],
    );
  }
}
