import 'package:abersoft_flutter/module/create_product/view/create_product_view.dart';
import 'package:abersoft_flutter/module/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/theme/constant.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    HomeController controller = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () async {
            Get.to(() => const CreateProductView(), duration: Duration.zero);
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: GetBuilder<HomeController>(builder: (_) {
          return ListView(
            padding: const EdgeInsets.all(10),
            children: [
              const Text(
                'Our Portofolio',
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: defaultH1),
              ),
              const SizedBox(height: 20),
              const Text(
                'Best Product',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: defaultH2,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              if (controller.productMap.isNotEmpty)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      controller.productMap['bestProduct'].length,
                      (int index) {
                        var item = controller.productMap['bestProduct'][index];
                        return Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(
                            right: 15.0,
                          ),
                          alignment: Alignment.center,
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                item['imageUrl'],
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                BorderRadius.circular(defaultRadiusCircular),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ID : ${item['id']}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Name : ${item['name']}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Desc : ${item['productDescription']}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                'All Product',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: defaultH2,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              if (controller.productMap.isNotEmpty)
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 100,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: controller.productMap['allProduct'].length,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var item = controller.productMap['allProduct'][index];
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            item['imageUrl'],
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius:
                            BorderRadius.circular(defaultRadiusCircular),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ID : ${item['id']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Name : ${item['name']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Desc : ${item['productDescription']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              const SizedBox(height: 80),
            ],
          );
        }),
      ),
    );
  }
}
