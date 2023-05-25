import 'package:flutter/material.dart';
import 'package:sort_it_out/styles.dart';

class EnvironmentalImpactSection extends StatelessWidget {
  const EnvironmentalImpactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'Why Recycle?',
            style: titleTextStyle,
          ),
          SizedBox(height: 16.0),
          Text(
            '• Reduce the amount of waste that goes to landfills\n'
            '• Conserve natural resources and energy\n'
            '• Reduce the need for raw materials to be extracted from the earth\n'
            '• Minimize the release of harmful chemicals into the environment\n'
            '• Create a cleaner and more sustainable future for our planet',
            style: subtitleTextStyle,
          ),
          SizedBox(height: 16.0),
          Text(
            'By taking small but meaningful steps like recycling household waste, we can all play a vital role in creating a cleaner and more sustainable future for our planet. Let\'s all do our part and make recycling a daily habit to help protect our planet for years to come.',
            style: subtitleTextStyle,
          ),
        ],
      ),
    );
  }
}
