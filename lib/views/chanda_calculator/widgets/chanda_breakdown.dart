import 'package:chanda_calculator/views/chanda_calculator/models/breakdown.dart';
import 'package:flutter/material.dart';

class ChandaBreakdown extends StatelessWidget {
  final double incomeValue;
  final String incomeType;
  Breakdown breakdown;

  ChandaBreakdown(this.incomeValue, this.incomeType);

  @override
  Widget build(BuildContext context) {
    this.breakdown = this.getBreakdown(incomeValue);
    return Column(
      children: <Widget>[
        Padding(padding:EdgeInsets.only(top: 8.0)),
        Text('Breakdown',style: TextStyle(fontSize: 22.0),),
        Padding(
          padding:EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 15.0),
          child: buildDataTable(breakdown),
        ),
      ],
    );
  }

  buildDataTable(Breakdown breakdown) {
    return DataTable(
      columnSpacing: 40.0,
      columns: [
        DataColumn(label: Text('', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Monthly',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0))),
        DataColumn(label: Text('Annually',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0))),
      ],
      rows: [
        DataRow(cells: buildDataColumn('Khuddam', breakdown.khuddamMonthly, breakdown.khuddamAnnual)),
        DataRow(cells: buildDataColumn('Ijtema', breakdown.ijtemaMonthly, breakdown.ijtemaAnnual)),
        DataRow(cells: buildDataColumn('Total', breakdown.monthTotal, breakdown.annualTotal)),
      ],
    );
  }

  List<DataCell> buildDataColumn(type, month, annual) {
    return [
      DataCell(Text(type, style: TextStyle(fontWeight: FontWeight.bold),)),
      DataCell(Text(month.toStringAsFixed(2))),
      DataCell(Text(annual.toStringAsFixed(2)))
    ];
  }

  Breakdown getBreakdown(double value) {
    Breakdown breakdown = new Breakdown();
    if (this.incomeType == 'A') {
      breakdown.khuddamAnnual = value / 100;
      breakdown.ijtemaAnnual = ((value / 100) / 4);

      breakdown.khuddamMonthly = breakdown.khuddamAnnual / 12;
      breakdown.ijtemaMonthly = breakdown.ijtemaAnnual / 12;
    } else {
      breakdown.khuddamMonthly = value / 100;
      breakdown.ijtemaMonthly = ((value / 100) / 4);

      breakdown.khuddamAnnual = breakdown.khuddamMonthly * 12;
      breakdown.ijtemaAnnual = breakdown.ijtemaMonthly * 12;
    }

    breakdown.monthTotal = (breakdown.khuddamMonthly + breakdown.ijtemaMonthly);
    breakdown.annualTotal = (breakdown.khuddamAnnual + breakdown.ijtemaAnnual);
    return breakdown;
  }
}
