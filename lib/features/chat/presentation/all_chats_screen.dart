import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:globaladvice_new/core/resource_manger/locale_keys.g.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';

import 'widgets/chat_item.dart';

class AllChatsScreen extends StatefulWidget {
  const AllChatsScreen({super.key});

  @override
  State<AllChatsScreen> createState() => _AllChatsScreenState();
}

class _AllChatsScreenState extends State<AllChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: ConfigSize.defaultSize!,),
            Center(
              child: Text(
                StringManager.messages.tr(),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: ConfigSize.defaultSize! * 2,
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
                child: ListView.separated(
                    itemBuilder: (context, index) => const ChatItem(),
                    separatorBuilder: (context, index) => SizedBox(height: ConfigSize.defaultSize! * 2,),
                    itemCount: 3
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
