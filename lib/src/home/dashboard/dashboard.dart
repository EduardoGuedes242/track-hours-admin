import 'package:flutter/material.dart';
import 'package:panel_admin/src/home/dashboard/widgets/count_dashboard.dart';
import 'package:panel_admin/src/home/dashboard/widgets/list_dashoboard.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CountDashboardWidget(
                legend: 'Total de funcionarios',
                value: '217',
                iconPath: 'assets/icon/dashboard_qtd_func.svg',
              ),
              CountDashboardWidget(
                legend: 'Total de atrasos nos ultimos 30 dias',
                value: '17',
                iconPath: 'assets/icon/dashboard_qtd_func.svg',
              ),
              CountDashboardWidget(
                legend: 'Total de faltas nos ultimos 30 dias',
                value: '2',
                iconPath: 'assets/icon/dashboard_qtd_func.svg',
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [ListDashoboardWidget(), ListDashoboardWidget()],
          ),
        ],
      ),
    );
  }
}
