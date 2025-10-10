import 'package:dawnforge/dawnforge.dart';
import 'package:flutter/material.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const TitleScreen());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.titleAppBarTitle)),
      body: const SafeArea(child: TitleView()),
    );
  }
}

class TitleView extends StatelessWidget {
  const TitleView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Center(
      child: SizedBox(
        width: 250,
        height: 64,
        child: ElevatedButton(
          onPressed: () async {
            await Navigator.of(
              context,
            ).pushReplacement<void, void>(GameScreen.route());
          },
          child: Center(child: Text(l10n.titleButtonStart)),
        ),
      ),
    );
  }
}
