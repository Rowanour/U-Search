import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni/models/unis_model.dart';
import 'package:uni/utils/colors.dart';
import 'package:uni/utils/dimensions.dart';
import '../cubit/uni_cubit.dart';
import '../widgets/big_text.dart';

class UniMatch extends StatefulWidget {
  const UniMatch({super.key});

  @override
  State<UniMatch> createState() => _UniMatchState();
}

class _UniMatchState extends State<UniMatch> {
  String? selectedLocation;
  String? selectedFees;
  List<Uni> filteredUniversities = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: AppColors.sky,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: BigText(
                  text: "Uni Match",
                  size: 30,
                  color: AppColors.navy,
                ),
              ),
            ),
            SizedBox(height: Dimensions.height20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Select Fees:',
                      style: TextStyle(fontSize: Dimensions.font12)),
                  BlocBuilder<UniCupit, List<Uni>>(
                    builder: (context, universities) {
                      final feeOptions = universities
                          .map((uni) => uni.fees.toString())
                          .toSet()
                          .toList();
                      return DropdownButton<String>(
                        hint: Text("Select Fees"),
                        value: selectedFees,
                        isExpanded: true,
                        items: feeOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text("\$$value"),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedFees = value;
                          });
                        },
                      );
                    },
                  ),
                  SizedBox(height: Dimensions.height10),
                  Text('Select Location:',
                      style: TextStyle(fontSize: Dimensions.font12)),
                  BlocBuilder<UniCupit, List<Uni>>(
                    builder: (context, universities) {
                      final locationOptions = universities
                          .map((uni) => uni.location)
                          .toSet()
                          .toList();
                      return DropdownButton<String>(
                        hint: Text("Select Location"),
                        value: selectedLocation,
                        isExpanded: true,
                        items: locationOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedLocation = value;
                          });
                        },
                      );
                    },
                  ),
                  SizedBox(height: Dimensions.height20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.navy,
                        padding:
                            EdgeInsets.symmetric(vertical: Dimensions.height15),
                      ),
                      onPressed: () {
                        context.read<UniCupit>().getUni();
                        _filterUniversities(context.read<UniCupit>().state);
                      },
                      child: Text('Find Universities',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: BlocBuilder<UniCupit, List<Uni>>(
                builder: (context, universities) {
                  if (filteredUniversities.isNotEmpty) {
                    return ListView.builder(
                      itemCount: filteredUniversities.length,
                      itemBuilder: (context, index) {
                        final university = filteredUniversities[index];
                        return ListTile(
                          title: Text(university.name),
                          subtitle: Text(
                              '${university.location}, Fees: \$${university.fees}'),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text(
                        'No universities matched your preferences.',
                        style: TextStyle(
                            color: AppColors.navy, fontSize: Dimensions.font12),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _filterUniversities(List<Uni> universities) {
    setState(() {
      filteredUniversities = universities.where((uni) {
        final matchesLocation =
            selectedLocation == null || uni.location == selectedLocation;
        final matchesFees =
            selectedFees == null || uni.fees.toString() == selectedFees;
        return matchesLocation && matchesFees;
      }).toList();
    });
  }
}
