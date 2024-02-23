import 'package:flutter/material.dart';

class TipCalculatorScreen extends StatefulWidget {
  @override
  _TipCalculatorScreenState createState() => _TipCalculatorScreenState();
}

class _TipCalculatorScreenState extends State<TipCalculatorScreen> {
  double billAmount = 0.0;
  double tipPercentage = 15.0;
  int numberOfEmployees = 1;
  int numberOfCustomers = 1;
  bool splitBill = false;

  double calculateTip() {
    return billAmount * tipPercentage / 100;
  }

  double calculateTipPerEmployee() {
    return calculateTip() / numberOfEmployees;
  }

  double calculateBillPerCustomer() {
    return (billAmount + calculateTip()) / numberOfCustomers;
  }

  double calculateTipPerCustomer() {
    return calculateTip() / numberOfCustomers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Bill Amount (₹)'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                setState(() {
                  billAmount = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                      'Tip Percentage: ${tipPercentage.toStringAsFixed(2)}%'),
                ),
                Slider(
                  value: tipPercentage,
                  min: 0,
                  max: 30,
                  divisions: 30,
                  onChanged: (value) {
                    setState(() {
                      tipPercentage = value.roundToDouble();
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(labelText: 'Number of Employees'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  numberOfEmployees = int.tryParse(value) ?? 1;
                });
              },
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Text('Split Bill? '),
                Checkbox(
                  value: splitBill,
                  onChanged: (value) {
                    setState(() {
                      splitBill = value ?? false;
                      if (!splitBill) {
                        numberOfCustomers = 1;
                      }
                    });
                  },
                ),
              ],
            ),
            if (splitBill) ...[
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(labelText: 'Number of Customers'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    numberOfCustomers = int.tryParse(value) ?? 1;
                  });
                },
              ),
            ],
            SizedBox(height: 16.0),
            Text(
              'Total Tip: ₹${calculateTip().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Tip Per Employee: ₹${calculateTipPerEmployee().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Bill Per Customer: ₹${calculateBillPerCustomer().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Tip Per Customer: ₹${calculateTipPerCustomer().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
