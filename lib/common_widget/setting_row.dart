import 'package:flutter/material.dart';

import '../common/colo_extension.dart';

class SettingRow extends StatelessWidget {
  final String icon;
  final String title;
  final bool isWarning;
  final VoidCallback onPressed;
  const SettingRow(
      {super.key,
      required this.icon,
      this.isWarning = false,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        highlightColor: isWarning
            ? TColor.red.withOpacity(0.1)
            : TColor.primaryColor1.withOpacity(0.1),
        child: SizedBox(
          height: 35,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                height: 30,
                width: 17,
                fit: BoxFit.contain,
                color: isWarning ? TColor.red : TColor.primaryColor1,
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: isWarning ? TColor.red : TColor.black,
                    fontSize: 14,
                  ),
                ),
              ),
              Image.asset(
                "assets/img/p_next.png",
                height: 13,
                width: 13,
                fit: BoxFit.contain,
                color: isWarning ? TColor.red : null,
              )
            ],
          ),
        ));
  }
}
