import 'package:abersoft_flutter/module/create_product/controller/create_product_controller.dart';
import 'package:abersoft_flutter/service/image_service.dart';
import 'package:abersoft_flutter/service/product_service.dart';
import 'package:abersoft_flutter/utility/widget/loading.dart';
import 'package:abersoft_flutter/utility/widget/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/theme/constant.dart';

class CreateProductView extends StatelessWidget {
  const CreateProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateProductController controller = Get.put(CreateProductController());
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<CreateProductController>(builder: (_) {
          return ListView(
            padding: const EdgeInsets.all(10),
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      Get.back();
                      ImageService.base64 = null;
                      ImageService.file = null;
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'Create Product',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: defaultH1),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Column(
                children: [
                  if (ImageService.file == null)
                    GestureDetector(
                      onTap: () async {
                        await ImageService.pickImageFromGallery();
                        controller.update();
                      },
                      child: Container(
                        height: 140,
                        width: 250,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              BorderRadius.circular(defaultRadiusCircular),
                        ),
                        child: const Text(
                          'Product Image',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  if (ImageService.file != null) Image.file(ImageService.file!),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: TextFormField(
                      controller: controller.nameC,
                      onChanged: (value) {
                        controller.update();
                      },
                      decoration: InputDecoration(
                        labelText: 'Product Name',
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(
                                Radius.circular(defaultRadiusCircular))),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        hintText: 'Product Name',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                        ),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(defaultRadiusCircular))),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: TextFormField(
                      controller: controller.descC,
                      maxLines: 7,
                      onChanged: (value) {
                        controller.update();
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(
                                Radius.circular(defaultRadiusCircular))),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        hintText: 'Product Description',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                        ),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(defaultRadiusCircular))),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (ImageService.file != null &&
                      controller.nameC.text != '' &&
                      controller.descC.text != '')
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: GestureDetector(
                        onTap: () async {
                          loadingProgress();

                          await ProductService.createProduct(
                              productName: controller.nameC.text,
                              productImage: ImageService.pathBase64!,
                              productDescription: controller.descC.text);

                          Get.back();
                          successDialog();
                          ImageService.file = null;
                          ImageService.pathBase64 = null;
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 45,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 1,
                                spreadRadius: 1,
                                color: Colors.black26,
                              ),
                            ],
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.circular(defaultRadiusCircular),
                          ),
                          child: const Text(
                            'Upload',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (ImageService.file == null ||
                      controller.nameC.text == '' ||
                      controller.descC.text == '')
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: GestureDetector(
                        onTap: () async {},
                        child: Container(
                          alignment: Alignment.center,
                          height: 45,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 1,
                                spreadRadius: 1,
                                color: Colors.black26,
                              ),
                            ],
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.circular(defaultRadiusCircular),
                          ),
                          child: const Text(
                            'Upload',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
