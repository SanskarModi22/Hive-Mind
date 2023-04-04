import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/core/utils.dart';

import '../../../core/common/error_text.dart';
import '../../../core/common/loader.dart';
import '../../../core/constants/constants.dart';
import '../../../theme/pallete.dart';
import '../../../widgets/custom_text.dart';
import '../controller/community_controller.dart';

class EditCommunityScreen extends ConsumerStatefulWidget {
  final String name;
  const EditCommunityScreen({required this.name, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditCommunityScreenState();
}

class _EditCommunityScreenState extends ConsumerState<EditCommunityScreen> {
  File? bannerImage;
  File? profileImage;

  void selectBannerImage() async {
    final res = await pickImage();
    if (res != null) {
      setState(() {
        bannerImage = File(res.files.first.path!);
      });
    }
  }

  void selectProfileImage() async {
    final res = await pickImage();
    if (res != null) {
      setState(() {
        profileImage = File(res.files.first.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(getCommunityByNameProvider(widget.name)).when(
          data: (community) => Scaffold(
            backgroundColor: Palette.darkModeAppTheme.colorScheme.background,
            appBar: AppBar(
              centerTitle: true,
              title: const CustomText(text: "Edit Community"),
              actions: [
                TextButton(
                    onPressed: () {}, child: const CustomText(text: "Save"))
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 200,
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: selectBannerImage,
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              dashPattern: const [10, 4],
                              strokeCap: StrokeCap.round,
                              radius: const Radius.circular(10),
                              color: Palette.darkModeAppTheme.textTheme
                                  .bodyMedium!.color!,
                              child: SizedBox(
                                width: double.infinity,
                                height: 150,
                                child: bannerImage != null
                                    ? Image.file(bannerImage!)
                                    : community.banner.isEmpty ||
                                            community.banner ==
                                                Constants.bannerDefault
                                        ? Center(
                                            child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.camera_alt_outlined,
                                                  size: 40,
                                                )),
                                          )
                                        : Image.network(community.banner),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: GestureDetector(
                              onTap: selectProfileImage,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(community.avatar),
                                radius: 32,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () => const Loader(),
        );
  }
}
