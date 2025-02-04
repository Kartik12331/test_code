
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/utils/color.dart';
import 'package:machine_test/utils/message.dart';
import 'package:machine_test/utils/static_list.dart';
import 'package:machine_test/utils/storage_manager/shar_pref.dart';
import 'package:machine_test/view/home/widget/third_tab.dart';
import '../../bloc/add_industry_bloc.dart';
import '../../bloc/add_industry_event.dart';
import '../../bloc/add_industry_state.dart';
import '../../utils/button/custom_button.dart';
import '../../utils/helper_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List alreadySelected  = [];
  List<String> selectedIndex = [];
  @override
  void initState(){

    Future.microtask(() async {
      var data =await   SharePref.getStoreList();
      alreadySelected.addAll(data);
for(var i =0; i<alreadySelected.length;i++ ){
  var index = alreadySelected[i];

  StaticList.value[int.parse(index)].selected = true;
  selectedIndex.add(index.toString());
}



      SharePref.storeList(value:selectedIndex);
      context
          .read<AddIndustriesBloc>()
          .add(SaveIndustriesEvent());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {




    final height = MediaQuery.of(context).size.height;


    return BlocBuilder<AddIndustriesBloc, AddIndustriesState>(
      builder: (context, state)  {

        return Scaffold(
            body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: height / 31,
              ),
              tabIndex(1),
              SizedBox(
                height: height / 51,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Choose Your ",
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  const Text(
                    "Industries",
                    style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Text(
                "Select At Least One Industry",
                style: TextStyle(color: AppColor.blackShade),
              ),
              const SizedBox(
                height: 21,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  for (var i = 0; i < StaticList.value.length; i++)
                   i
                ]
                    .map((i) => GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 13.0),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 7),
                            decoration: BoxDecoration(
                              color:StaticList.value[i].selected == true
                                  ? AppColor.black
                                  : AppColor.blackShade.withOpacity(.1),
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.circular(31),
                            ),
                            child: Text(
                              "\$  ${StaticList.value[i].name}",
                              style: TextStyle(
                                color: StaticList.value[i].selected == true
                                    ? AppColor.white
                                    : AppColor.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          onTap: () {
                            StaticList.value[i].selected = !StaticList.value[i].selected;
                         var index = StaticList.value.indexWhere((element) => element.name == StaticList.value[i].name);

                            if(selectedIndex.contains(index.toString())){
                              selectedIndex.remove(index.toString());
                            }else{
                              selectedIndex.add(index.toString());
                            }
                            SharePref.storeList(value:selectedIndex);
                            context
                                .read<AddIndustriesBloc>()
                                .add(SaveIndustriesEvent());
                          },
                        ))
                    .toList(),
              ),
              const Spacer(),
              NextButton(
                onPress: () {
                  int index = StaticList.value.indexWhere((element) => element.selected == true);

                  if (index == -1) {
                    ShowMessage.error(message: "Please Select At Least One");
                    return;
                  }
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => const AddVideo()));
                },
              ),
              SizedBox(
                height: height / 21,
              ),
            ],
          ),
        ));
      },
    );
  }
}
