import 'package:flutter/material.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TitleTag extends ConsumerWidget {
  const TitleTag({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider);
    return Flexible(
      child: FittedBox(
        child: Chip(
          labelPadding: EdgeInsets.zero,
          // color: WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          label: Text(
            t.home.tag_title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
