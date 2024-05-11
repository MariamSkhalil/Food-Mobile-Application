// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:coolapp/models/category_model.dart';
import 'package:coolapp/models/popular_model.dart';
import 'package:coolapp/models/diet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void _getInitialInfo() {
    diets = DietModel.getDiets();
    categories = CategoryModel.getCategories();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  @override
Widget build(BuildContext context) {
  _getInitialInfo();
  return Scaffold(
    //debugShowCheckedModeBanner: false,
    appBar: appBar(),
    backgroundColor: Colors.white,
    body: ListView(
      children: [
        _searchField(),
        const SizedBox(height: 40,),
        _categoriesSection(),
        const SizedBox(height: 40,),
        _dietSection(),
        const SizedBox(height: 40,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Popular',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 15,),
            ListView.builder(
              itemCount: popularDiets.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 20, right: 20),
              itemBuilder: (context, index){
              return Column(
                children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: popularDiets[index].boxIsSelected ? Colors.white :Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow:popularDiets[index].boxIsSelected ? [
                      BoxShadow(
                        color: Color(0xff1D1617).withOpacity(0.07),
                        offset: Offset(0, 10),
                        blurRadius: 40,
                        spreadRadius: 0
                      ),
                    ] : [],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(popularDiets[index].iconPath,height: 65,width: 65,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            popularDiets[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16
                            ),
                          ),
                          Text(
                          '${popularDiets[index].level}|${popularDiets[index].duration}|${popularDiets[index].calorie}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 110, 95, 100),
                            fontSize: 13,
                          ),
                        ),

                        ],
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: SvgPicture.asset('assets/icons/button.svg',width:30 ,height: 30,))
                  ],),
                ),
                 SizedBox(height: 25), // Adds separation between items
                  ],
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 40,),
      ],
    ),
  );
}

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Recommendation\nfor Diet',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 240,
          color: Colors.white,
          child: ListView.separated(
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => SizedBox(
              width: 25,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 210,
                decoration: BoxDecoration(
                  color: diets[index].boxColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(diets[index].iconPath),
                    Column(
                      children: [
                        Text(
                          diets[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${diets[index].level}|${diets[index].duration}|${diets[index].calorie}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 110, 95, 100),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 45,
                      width: 130,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            diets[index].viewIsSelected
                                ? Color(0xff90CEff)
                                : Colors.transparent,
                            diets[index].viewIsSelected
                                ? Color(0xff92A3FD)
                                : Colors.transparent,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'View',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: diets[index].viewIsSelected
                                ? Colors.white
                                : Color(0xffC58BF2),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 120,
          color: Colors.white,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => SizedBox(
              width: 25,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(categories[index].iconPath),
                        ),
                      ),
                      Text(
                        categories[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14),
                      )
                    ]),
              );
            },
          ),
        )
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, right: 20, left: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(15),
            hintText: 'Search Pancake',
            hintStyle: TextStyle(color: Color(0xffDDDADA), fontSize: 14),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/Search.svg'),
            ),
            // ignore: sized_box_for_whitespace
            suffixIcon: Container(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset('assets/icons/Filter.svg'),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        'BreakFast',
        style: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.arrow_back)
            // child: SvgPicture.asset('assets/icons/ArrowLeft.svg', height: 20, width: 20),
            ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            width: 37,
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            //child: const Icon(Icons.arrow_back)
            child:
                SvgPicture.asset('assets/icons/dots.svg', height: 5, width: 5),
          ),
        )
      ],
    );
  }
}
