import 'package:get/get.dart';
import '../../core/values/sizes.dart';
import '../../core/values/values.dart';
import 'package:flutter/material.dart';
import '../../core/values/strings.dart';
import '../../widgets/candidate/candidate_card.dart';
import '../../controllers/candidate/candidate_list_controller.dart';
import '../../controllers/candidate/candidate-details-controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CandidateListController candidateListController =
      Get.put(CandidateListController());

  CandidateDetailsController candidateDetailsController =
      Get.put(CandidateDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Obx(
                () => candidateListController.loading.value
                    ? const Center(
                        child: SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                            strokeWidth: 2,
                          ),
                        ),
                      )
                    : Stack(children: [titleTxt(), candidateListSection()]),
              )),
        ));
  }

  Widget titleTxt() {
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.02),
      child: Text(home_title, style: AppTextStyles.header),
    );
  }

  Widget candidateListSection() {
    List<Widget> candidates = List.generate(
        candidateListController.candidate?.data.length ?? 0,
        (index) => GestureDetector(
              onTap: () => candidateDetailsController.fetchCandidateDetails(
                  candidateListController.candidate?.data[index].id ?? 1),
              child: CandidateCard(
                avatar:
                    candidateListController.candidate?.data[index].avatar ?? "",
                email:
                    candidateListController.candidate?.data[index].email ?? "",
                firstName:
                    candidateListController.candidate?.data[index].firstName ??
                        "",
                lastName:
                    candidateListController.candidate?.data[index].lastName ??
                        "",
              ),
            ));
    return Padding(
        padding: EdgeInsets.only(top: sizeHeight * 0.08),
        child: ListView(children: [...candidates]));
  }
}
