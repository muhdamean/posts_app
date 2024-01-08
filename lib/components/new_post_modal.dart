import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/app_text_field.dart';
import 'package:flutter_full_course/provider/app_repo.dart';
import 'package:flutter_full_course/provider/post_provider.dart';
import 'package:flutter_full_course/styles/app_colors.dart';
import 'package:flutter_full_course/styles/app_text.dart';
import 'package:provider/provider.dart';

class NewPostModal extends StatelessWidget {
  const NewPostModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Insert Message',
            style: AppText.header1,
          ),
          const SizedBox(
            height: 16,
          ),
          AppTextField(
            hint: 'Message ...',
            onChange: (value) {
              context.read<PostProvider>().message = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Add Image',
            style: AppText.header1,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            child: const Center(
              child: Text('Upload from gallery'),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text('OR'),
          const SizedBox(
            height: 16,
          ),
          OutlinedButton(onPressed: () {}, child: const Text('Camera')),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () {
                context
                    .read<PostProvider>()
                    .createPost(context.read<AppRepo>().token!)
                    .then((value) => Navigator.of(context).pop());
              },
              child: const Text('Create Post'))
        ],
      ),
    );
  }
}
