import 'package:flutter/material.dart';

import 'gradient_circular_progress_indicator.dart';

class PendingAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: GradientCircularProgressIndicator(
            gradient: SweepGradient(colors: [
              Color.fromRGBO(252, 238, 200, 1),
              Color.fromRGBO(253, 188, 7, 1)
            ]),
          ),
        ),
        ModalBarrier(
          dismissible: false,
          color: Colors.black.withOpacity(0.2),
        ),
      ],
    );
  }
}
