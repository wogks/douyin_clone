import 'package:douyin_clone/features/videos/view_models/video_config_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: ListView(
          children: [
            SwitchListTile.adaptive(
              value: ref.watch(playbackConfigProvider).muted,
              onChanged: (value) {
                ref.read(playbackConfigProvider.notifier).setMuted(value);
              },
              title: const Text('음소거'),
            ),
            SwitchListTile.adaptive(
              value: ref.watch(playbackConfigProvider).autoplay,
              onChanged: (value) {
                ref.read(playbackConfigProvider.notifier).setAutoplay(value);
              },
              title: const Text('자동재생'),
            ),
            const AboutListTile(
              applicationVersion: '1.1',
              applicationLegalese: 'All rights reserved.',
            ),
            ListTile(
              title: const Text('Log out (iOS)'),
              textColor: Colors.red,
              onTap: () => showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: const Text("Are you sure?"),
                    content: const Text('I wish you come back'),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('No'),
                      ),
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        isDestructiveAction: true,
                        child: const Text('Yes'),
                      ),
                    ],
                  );
                },
              ),
            ),
            ListTile(
              title: const Text('Log out (Material)'),
              textColor: Colors.red,
              onTap: () => showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Are you sure?"),
                    content: const Text('I wish you come back'),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('No'),
                      ),
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        isDestructiveAction: true,
                        child: const Text('Yes'),
                      ),
                    ],
                  );
                },
              ),
            ),
            ListTile(
              title: const Text('Log out (Material, modal popup)'),
              textColor: Colors.red,
              onTap: () => showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return CupertinoActionSheet(
                    title: const Text("Are you sure?"),
                    message: const Text('가지마세요 ㅠ'),
                    actions: [
                      CupertinoActionSheetAction(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          'No Logout',
                        ),
                      ),
                      CupertinoActionSheetAction(
                        isDestructiveAction: true,
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          'Yes',
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ));
  }
}
