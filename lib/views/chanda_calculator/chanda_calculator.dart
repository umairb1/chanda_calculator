import 'package:chanda_calculator/views/chanda_calculator/widgets/chanda_breakdown.dart';
import 'package:chanda_calculator/widgets/custom_label/custom_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ChandaCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Chanda Calculator",
        home: Scaffold(
            appBar: AppBar(
              title: Text("Chanda Calculator"),
            ),
            body: Material(child: Center(child: new ChandaCalculatorForm()))));
  }
}

class ChandaCalculatorForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ChandaCalculatorFormState();
}

class ChandaCalculatorFormState extends State<ChandaCalculatorForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String incomeType = 'A';
  String incomeLabel = 'Annual Income';
  double incomeValue;
  Widget chandaBreakDown = new Container();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
        child: ListView(
          children: <Widget>[
            Card(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Chanda Calculator', style: TextStyle(fontSize: 30.0)),
                    CustomLabel(
                        'Select Income Type',
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text('Annual'),
                            _buildRadio('A'),
                            Text('Monthly'),
                            _buildRadio('M'),
                          ],
                        )),
                    TextFormField(
                      decoration: InputDecoration(labelText: incomeLabel),
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        CurrencyInputFormatter(),
                      ],
                      onChanged: (value) {
                        value = value == '' ? '0' : value;
                        this.incomeValue = double.parse(value.replaceAll(RegExp('[^0-9]'), ""));
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: this.buildBreakdown,
                            child: Text('Calculate Chanda'),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )),
            Card(
              margin: EdgeInsets.only(left: 0.0, right: 0.0, top: 30.0),
              child: this.chandaBreakDown,
            ),
          ],
        ));
  }

  Widget _buildRadio(String value) {
    return Radio(
        value: value,
        groupValue: this.incomeType,
        onChanged: (selectedValue) => this.setState(() {
              this.incomeType = selectedValue;
              incomeLabel = value == 'A' ? 'Annual Income' : 'Monthly Income';
            }));
  }

  buildBreakdown() {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (this.formKey.currentState.validate() && this.incomeValue != null) {
      this.chandaBreakDown = ChandaBreakdown(this.incomeValue, this.incomeType);
      this.formKey.currentState.save();
      this.setState(() {});
    } else {
      this.chandaBreakDown = new Container();
    }
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) { return newValue;}

    String _onlyDigits = newValue.text.replaceAll(RegExp('[^0-9]'), "");
    num value = num.parse(_onlyDigits);
    final formatter = NumberFormat.currency(decimalDigits: 0, locale: 'cy', symbol: '');
    String newText = formatter.format(value).trim();
    num offset = newText.length == 0 ? 1 : newText.length;

    return newValue.copyWith(text: newText, selection: new TextSelection.collapsed(offset: offset));
  }
}
