import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:panel_admin/src/common/Cores.dart';

class CountDashboardWidget extends StatelessWidget {
  const CountDashboardWidget({
    super.key,
    required this.iconPath,
    required this.value,
    required this.legend,
  });
  final String iconPath;
  final String value;
  final String legend;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: (MediaQuery.sizeOf(context).width - 350) / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0XFFFFFFFF),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 5,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    color: PaletaCores.textoPreto,
                    fontFamily: 'Axiforma',
                    fontWeight: FontWeight.w900,
                    fontSize: 32,
                  ),
                ),
                SvgPicture.asset(iconPath, width: 70, height: 70),
              ],
            ),
            SizedBox(height: 10),
            Text(
              legend,
              style: TextStyle(
                color: PaletaCores.textoPreto,
                fontFamily: 'Axiforma',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
