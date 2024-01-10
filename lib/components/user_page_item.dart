// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/user_avatar.dart';

import 'package:flutter_full_course/data/model/user.dart';
import 'package:flutter_full_course/styles/app_colors.dart';
import 'package:flutter_full_course/styles/app_text.dart';

class UserPageItem extends StatelessWidget {
  final User user;
  const UserPageItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              UserAvatar(
                size: 50,
              ),
              SizedBox(
                width: 14,
              ),
              Column(
                children: [
                  Text(
                    '${user.firstname} ${user.lastname}',
                    style: AppText.subtitle1.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    user.location?.name ?? '',
                    style: AppText.body2.copyWith(color: AppColors.black),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
