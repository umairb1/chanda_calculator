// import 'package:chanda_calculator/widgets/custom_label/custom_label.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_masked_text/flutter_masked_text.dart';

// class ChandaCalculator extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: "Hello World!",
//         home: Scaffold(
//             appBar: AppBar(
//               title: Text("First Flutter App!"),
//             ),
//             body: Material(child: Center(child: new ChandaCalculatorForm()))));
//   }
// }

// class ChandaCalculatorForm extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => new ChandaCalculatorFormState();
// }

// class ChandaCalculatorFormState extends State<ChandaCalculatorForm> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   String incomeType = 'A';
//   String incomeLabel = 'Annual Income';
//   String incomeValue;
//   Widget chandaBreakDown = new Container();
//   final moneyFormatter = MoneyMaskedTextController(
//       initialValue: 0.00,
//       decimalSeparator: '.',
//       thousandSeparator: ',',
//       leftSymbol: '');

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
//         child: ListView(
//           // child: Column(
//             children: <Widget>[
//               Card(
//                   child: Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       Text('Chanda Calculator',
//                           textDirection: TextDirection.ltr,
//                           style: TextStyle(fontSize: 32.0)),
//                       CustomLabel(
//                           'Select Income Type',
//                           Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               Text('Annual'),
//                               _buildRadio('A'),
//                               Text('Monthly'),
//                               _buildRadio('M'),
//                             ],
//                           )),
//                       TextFormField(
//                         decoration: InputDecoration(labelText: incomeLabel),
//                         controller: moneyFormatter,
//                         validator: (value) {
//                           if (value == '£0.00' || value == '£0.000') {
//                             return 'Enter a value greater than £0.00';
//                           }
//                           return null;
//                         },
//                         keyboardType: TextInputType.number,
//                         onSaved: (input) {},
//                         onChanged: (value) => this.incomeValue =
//                             this.moneyFormatter.numberValue.toString(),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: <Widget>[
//                           Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: RaisedButton(
//                               onPressed: handleCalculation,
//                               child: Text('Calculate Chanda'),
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               )),
//               Card(
//                 margin: EdgeInsets.only(left: 0.0, right: 0.0, top: 30.0),
//                 child: this.chandaBreakDown,
//               ),
//             ],
//           // ),
//         ));
//   }

//   Widget _buildRadio(String value) {
//     return Radio(
//         value: value,
//         groupValue: this.incomeType,
//         onChanged: (selectedValue) => this.setState(() {
//               this.incomeType = selectedValue;
//               incomeLabel = value == 'A' ? 'Annual Income' : 'Monthly Income';
//             }));
//   }

//   handleCalculation() {
//     FocusScope.of(context).requestFocus(new FocusNode());
//     if (!this.formKey.currentState.validate()) {
//       this.chandaBreakDown = new Container();
//     } else {
//       if (this.incomeValue == null) {
//         this.incomeValue = '0.00';
//       }
//       double value = double.parse(this.incomeValue.replaceAll(RegExp(','), ""));

//       Breakdown breakdown = getBreakdown(value);

//       this.chandaBreakDown = new Column(
//         children: <Widget>[
//           Text(
//             'Breakdown',
//             style: TextStyle(fontSize: 22.0),
//           ),
//           Padding(
//             padding:
//                 EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 15.0),
//             // child: buildTable(breakdown),
//             child: buildDataTable(breakdown),
//           ),
//           // Text('Annual Breakdown', style: TextStyle(fontSize: 20.0)),
//           // Padding(
//           //   padding: EdgeInsets.all(8.0),
//           //   child: buildTable(breakdown.khuddamAnnual, breakdown.ijtemaAnnual,
//           //       breakdown.annualTotal),
//           // )
//         ],
//       );
//     }

//     this.formKey.currentState.save();
//     this.setState(() {});
//   }

//   buildDataTable(Breakdown breakdown) {
//     return DataTable(
//       columnSpacing: 40.0,
//       // dataRowHeight: 40.0,
//       // columns: buildDataColumn('Type', 'Monthly', 'Annually'),
//       columns: [
//         DataColumn(label: Text('', style: TextStyle(fontWeight:FontWeight.bold))),
//         DataColumn(label: Text('Monthly', style: TextStyle(fontWeight:FontWeight.bold, fontSize: 15.0))),
//         DataColumn(label: Text('Annually', style: TextStyle(fontWeight:FontWeight.bold, fontSize: 15.0))),
//       ],
//       rows: [
//         DataRow(
//           cells: [
//             DataCell(Text('Khuddam', style: TextStyle(fontWeight:FontWeight.bold),)),
//             DataCell(Text(breakdown.khuddamMonthly.toStringAsFixed(2))),
//             DataCell(Text(breakdown.khuddamAnnual.toStringAsFixed(2))),
//           ]
//         ),
//         DataRow(
//           cells: [
//             DataCell(Text('Ijtema', style: TextStyle(fontWeight:FontWeight.bold),)),
//             DataCell(Text(breakdown.ijtemaMonthly.toStringAsFixed(2))),
//             DataCell(Text(breakdown.ijtemaAnnual.toStringAsFixed(2))),
//           ]
//         ),
//         DataRow(
//           cells: [
//             DataCell(Text('Total', style: TextStyle(fontWeight:FontWeight.bold),)),
//             DataCell(Text(breakdown.monthTotal.toStringAsFixed(2))),
//             DataCell(Text(breakdown.annualTotal.toStringAsFixed(2)))
//           ]
//         ),
//       ],
//     );
//   }

//   List<DataColumn> buildDataColumn(type, chanda, chanda2) {
//     return [
//       DataColumn(label: Text(type, style: TextStyle(fontSize: 18.0),)),
//       DataColumn(label: Text(chanda, style: TextStyle(fontSize: 18.0),)),
//       DataColumn(label: Text(chanda2, style: TextStyle(fontSize: 18.0),))
//       // DataColumn( Text(type, style: TextStyle(fontSize: 18.0), textAlign: TextAlign.center,),
//       // Text(chanda, style: TextStyle(fontSize: 18.0), textAlign: TextAlign.center,),
//       // Text(chanda2, style: TextStyle(fontSize: 18.0), textAlign: TextAlign.center,),
//       // Text('£' + chanda.toStringAsFixed(2), style: TextStyle(fontSize: 14.0))
//     ];
//   }

//   Table buildTable(Breakdown breakdown) {
//     print(breakdown);
//     return Table(
//       border: TableBorder.all(),
//       textBaseline: TextBaseline.ideographic,
//       children: [
//         buildTableRow('Type', 'Monthly', 'Annually'),
//         buildTableRow('Khuddam', breakdown.khuddamMonthly.toStringAsFixed(2), breakdown.khuddamAnnual.toStringAsFixed(2)),
//         buildTableRow('Ijtema', breakdown.ijtemaMonthly.toStringAsFixed(2), breakdown.ijtemaAnnual.toStringAsFixed(2)),
//         buildTableRow('Total', breakdown.monthTotal.toStringAsFixed(2), breakdown.annualTotal.toStringAsFixed(2)),
//         // buildTableRow('Ijtema Chanda', ijtemaChanda),
//         // buildTableRow('Total', total),
//       ],
//     );
//   }

//   TableRow buildTableRow(type, chanda, chanda2) {
//     return TableRow(children: [
//       Text(type, style: TextStyle(fontSize: 18.0), textAlign: TextAlign.center,),
//       Text(chanda, style: TextStyle(fontSize: 18.0), textAlign: TextAlign.center,),
//       Text(chanda2, style: TextStyle(fontSize: 18.0), textAlign: TextAlign.center,),
//       // Text('£' + chanda.toStringAsFixed(2), style: TextStyle(fontSize: 14.0))
//     ]);
//   }

//   Breakdown getBreakdown(double value) {
//     Breakdown breakdown = new Breakdown();

//     if (this.incomeType == 'A') {
//       breakdown.khuddamAnnual = value / 100;
//       breakdown.ijtemaAnnual = ((value / 100) / 4);

//       breakdown.khuddamMonthly = breakdown.khuddamAnnual / 12;
//       breakdown.ijtemaMonthly = breakdown.ijtemaAnnual / 12;
//     } else {
//       breakdown.khuddamMonthly = value / 100;
//       breakdown.ijtemaMonthly = ((value / 100) / 4);

//       breakdown.khuddamAnnual = breakdown.khuddamMonthly * 12;
//       breakdown.ijtemaAnnual = breakdown.ijtemaMonthly * 12;
//     }

//     breakdown.monthTotal = (breakdown.khuddamMonthly + breakdown.ijtemaMonthly);
//     breakdown.annualTotal = (breakdown.khuddamAnnual + breakdown.ijtemaAnnual);

//     return breakdown;
//   }

// }

// class Breakdown {
//   double khuddamMonthly;
//   double khuddamAnnual;

//   double ijtemaMonthly;
//   double ijtemaAnnual;

//   double monthTotal;
//   double annualTotal;
// }
