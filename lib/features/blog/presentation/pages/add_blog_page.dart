import 'dart:io';

import 'package:bloc_app/core/utils/pick_image.dart';
import 'package:bloc_app/features/blog/presentation/widget/edit_blog_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_palete.dart';

class AddBlogPage extends StatefulWidget {
  const AddBlogPage({super.key});

  @override
  State<AddBlogPage> createState() => _AddBlogPageState();
}

class _AddBlogPageState extends State<AddBlogPage> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController contentcontroller = TextEditingController();
  List<String> selectedOption = [];
  final formKey = GlobalKey<FormState>();

  File? image;

  void selectImage() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  @override
  void dispose() {
    titlecontroller.dispose();
    contentcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.done_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                image != null
                    ? GestureDetector(
                        onTap: () {
                          selectImage();
                        },
                        child: SizedBox(
                            width: double.infinity,
                            height: 150,
                            child: Image.file(image!, fit: BoxFit.cover,)))
                    : GestureDetector(
                        onTap: () {
                          selectImage();
                        },
                        child: DottedBorder(
                          color: AppPallete.borderColor,
                          radius: const Radius.circular(15),
                          dashPattern: const [10, 4],
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.folder_copy_outlined,
                                  color: AppPallete.whiteColor,
                                ),
                                Text(
                                  'Select your image',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      'Technology',
                      'Bussiness',
                      'Programming',
                      'Entertainment',
                    ]
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(5),
                            child: GestureDetector(
                                onTap: () {
                                  if (selectedOption.contains(e)) {
                                    selectedOption.remove(e);
                                  } else {
                                    selectedOption.add(e);
                                  }
                                  setState(() {});
                                },
                                child: Chip(
                                  label: Text(e),
                                  color: WidgetStatePropertyAll(
                                      selectedOption.contains(e)
                                          ? AppPallete.gradient1
                                          : null),
                                  side: selectedOption.contains(e)
                                      ? null
                                      : const BorderSide(
                                          color: AppPallete.borderColor),
                                )),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                EditBlogWidget(text: 'Blog title', controller: titlecontroller),
                const SizedBox(
                  height: 10,
                ),
                EditBlogWidget(
                    text: 'Blog content', controller: contentcontroller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// TODO: Presentation
// TODO: Blog consumer