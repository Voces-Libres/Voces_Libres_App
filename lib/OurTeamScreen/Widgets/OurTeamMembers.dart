import 'package:flutter/material.dart';
import '../../exports.dart';

class OurTeamMembers extends StatelessWidget{
  @override
  const OurTeamMembers({
    required this.viewModel,
    super.key,
});

  final OurTeamScreenModel viewModel;

  @override
  Widget build(BuildContext context){
    return Container(
      width: getDeviceWidth(context),
      height: getDeviceHeight(context) * 0.7,
      margin: EdgeInsets.only(
        left: getDeviceWidth(context) * 0.02,
        right: getDeviceWidth(context) * 0.02
      ),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: viewModel.members.length,
          itemBuilder: (context, index){
            return Container(
              width: getDeviceWidth(context) * 0.4,
              height: getDeviceHeight(context) * 0.4,
              margin: EdgeInsets.only(
                left: getDeviceWidth(context) * 0.05,
                right: getDeviceWidth(context) * 0.05
              ),
              child: Column(
                children: [
                  // Profile Picture
                  Container(
                    width: getDeviceWidth(context) * 0.35,
                    height: getDeviceHeight(context) * 0.2,
                    margin: EdgeInsets.only(
                      top: getDeviceWidth(context) * 0.02,
                      bottom: getDeviceWidth(context) * 0.02,
                      left: getDeviceWidth(context) * 0.025,
                      right: getDeviceWidth(context) * 0.025
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.black, offset: Offset.zero, blurStyle: BlurStyle.normal, blurRadius: 9)],
                      borderRadius: BorderRadius.circular(256),
                      image: DecorationImage(
                        image: AssetImage(viewModel.members[index].profilePicture),
                        fit: BoxFit.fill
                      )
                    ),
                  ),

                  // Profile Details
                  Container(
                    width: getDeviceWidth(context) * 0.4,
                    height: getDeviceHeight(context) * 0.4,
                    child: Column(
                      children: [
                        // Profile Name
                        Container(
                          width: getDeviceWidth(context) * 0.4,
                          height: getDeviceHeight(context) * 0.12,
                          margin: EdgeInsets.only(
                            bottom: getDeviceHeight(context) * 0.02
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white.withOpacity(0.8)
                          ),
                          child: Column(
                            children: [
                              const Spacer(),
                              Text(viewModel.members[index].profileName, style: const TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                              const Spacer(),
                              ],
                           )
                        ),

                        // Profile Role
                        Container(
                          width: getDeviceWidth(context) * 0.4,
                          height: getDeviceHeight(context) * 0.15,
                          margin: EdgeInsets.only(
                              bottom: getDeviceHeight(context) * 0.02
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            color: Colors.white.withOpacity(0.4)
                          ),
                          child: Column(
                            children: [
                              const Spacer(),
                              Text(viewModel.members[index].profileRole, style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                              const Spacer(),
                          ],
                          )
                        ),


                      ],
                    ),
                  )

                ],
              ),
            );
    },
      )
    );
  }

}