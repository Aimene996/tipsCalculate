import 'package:flutter/material.dart';

import 'ticket.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double billAmount = 0.0;
  dynamic pousentage = 0;
  int participation = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 150,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "amount of participation:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${calculateTotalPerPerson(billAmount, participation, pousentage)}",
                  // "${ calculatTotalePerPerson(totaltips, _billAmount, _participation)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 300,
            width: 200,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                        prefixText: "bill amount",
                        prefixIcon: Icon(Icons.attach_money)),
                    onChanged: (value) {
                      try {
                        billAmount = double.parse(value);
                      } catch (e) {
                        billAmount = 0;
                      }
                    },
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "split:",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (participation > 1) {
                                  participation--;
                                }
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.purple.shade50,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                  child: Text(
                                "-",
                                style: TextStyle(fontSize: 24),
                              )),
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text("$participation"),
                          const SizedBox(
                            width: 6,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                participation++;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.purple.shade50,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                  child: Text(
                                "+",
                                style: TextStyle(fontSize: 24),
                              )),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tip:',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '\$${calculateTotalTips(billAmount, participation, pousentage)}',
                        style:
                            const TextStyle(color: Colors.purple, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Text(
                      "$pousentage %",
                      style:
                          const TextStyle(color: Colors.purple, fontSize: 17),
                    ),
                    Slider(
                        divisions: 20,
                        min: 0,
                        max: 100,
                        inactiveColor: Colors.grey.shade300,
                        activeColor: Colors.purple.shade600,
                        value: pousentage.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            pousentage = newValue.round();
                          });
                        })
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Ticket(
                              amount: billAmount,
                            )),
                  );
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                      child: Text(
                    "Get your Ticket",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }

  calculateTotalPerPerson(
      double billAmount, int splitBy, dynamic tipsPersentage) {
    var totalPerson =
        (calculateTotalTips(billAmount, splitBy, tipsPersentage) + billAmount) /
            splitBy;
    return totalPerson;
  }

  calculateTotalTips(double billAmount, int splitBy, int tipsPersentage) {
    double totalTips = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty) {
    } else {
      totalTips = (billAmount * tipsPersentage) / 100;
    }
    return totalTips;
  }
}
