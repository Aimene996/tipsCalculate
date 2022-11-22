import 'package:flutter/material.dart';
import 'package:tipscalculate/home.dart';

class Ticket extends StatelessWidget {
  const Ticket({
    Key? key,
    required this.amount,
  }) : super(key: key);
  final dynamic amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(60),
          height: 300,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.purple.shade50,
              border: Border.all(),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("billAmount:${amount}"),
                Text('the total of the facture:'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
