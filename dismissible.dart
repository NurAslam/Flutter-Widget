import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class DismissibleDialog extends StatefulWidget {
  const DismissibleDialog({Key key}) : super(key: key);

  @override
  _DismissibleDialogState createState() => _DismissibleDialogState();
}

class _DismissibleDialogState extends State<DismissibleDialog> {
  Faker faker = new Faker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissible"),
      ),
      body: ListView.builder(
          itemCount: 100,
          padding: EdgeInsets.all(8),
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(index.toString()),
              direction: DismissDirection.endToStart,
              confirmDismiss: (direction) {
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("ini peringatan"),
                      actions: [
                        MaterialButton(
                          onPressed: () {
                            print("NO");
                            Navigator.of(context).pop(false);                            
                          },
                          child: Text("NO"),
                        ),
                        MaterialButton(
                          onPressed: () {
                            print("YES");
                            Navigator.of(context).pop(true);
                      
                          },
                          child: Text("YES"),
                        )
                      ],
                    );
                  },
                );
              },
              background: Container(
                color: Colors.red,
                child: Icon(
                  Icons.delete,
                  size: 30,
                  color: Colors.white,
                ),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 10),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text("${index + 1}"),
                ),
                title: Text(faker.person.name()),
                subtitle: Text(faker.job.title()),
              ),
            );
          }),
    );
  }
}
