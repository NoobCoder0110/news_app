
import 'package:flutter/material.dart';

class DetailList extends StatelessWidget {
  const DetailList({
    super.key,
    required this.title,
    required this.list, required this.textsize,
  });

  final String title;
  final List<String>? list;
  final double textsize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: textsize),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: list!.length,
          itemBuilder: (context, index) {
            final data = list![index];
            return Text(data);
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
