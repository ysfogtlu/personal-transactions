import 'package:flutter/material.dart';
import 'models/account_data.dart';

class AccountSelection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AccountSelectionState();
}

class _AccountSelectionState extends State<AccountSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: <Widget>[
              Expanded(
                child: Card(
                    child :FutureBuilder<List<AccountData>>(
                      future: fetchData(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return Center(
                            child: CircularProgressIndicator()
                        );
                        return ListView(
                          children: snapshot.data!.map((data) => Card(
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => {getItemAndNavigate(data.id, context)},
                                  child: Row(children: [
                                    Container(
                                        width: 100,
                                        height: 100,
                                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(8.0),
                                        )
                                    ),
                                    Flexible(
                                        child: Text(data.title,
                                            style: TextStyle(fontSize: 18))),
                                  ]),
                                ),
                                Divider(color: Colors.black),
                              ],
                            ),
                          ))
                              .toList(),
                        );
                      },
                    )
                ),
              ),
            ]
        )
    );
  }
  getItemAndNavigate(id, BuildContext context) {}
  fetchData() {}
}
