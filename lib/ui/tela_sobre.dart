import 'package:flutter/material.dart';

class TelaSobre extends StatelessWidget {
  const TelaSobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Meus Veiculos'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TelaSobre()));
                },
                icon: const Icon(Icons.info))
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: const Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Desenvolvido por',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            Text(
              'Tobias Santos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            Text(
              '&',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            Text(
              'Davi Cruz',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            )
          ]),
        ));
  }
}
