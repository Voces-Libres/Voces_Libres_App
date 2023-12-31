import 'package:flutter/material.dart';
import 'package:voces_libres/DecalogueScreen/decalogueScreen_view.dart';
import 'package:voces_libres/ManifestScreen/manifestScreen_view.dart';
import 'package:voces_libres/PostersScreen/postersScreen_view.dart';
import 'package:voces_libres/TransparencyScreen/transparencyScreen_model.dart';
import 'package:voces_libres/TransparencyScreen/transparencyScreen_view.dart';
import 'exports.dart';

void main() => runApp(const MainApp());


class MainApp extends StatelessWidget{

  @override
  const MainApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HomeScreenView(),
      routes: {
        "HomeScreen" :  (_) => const HomeScreenView(),
        "AboutUsScreen" : (_) => const AboutUsScreenView(),
        "DocumentsScreen" : (_) => const DocumentsScreenView(),
        "BlogScreen" : (_) => const BlogScreenView(),
        "ContactScreen" : (_) => const ContactScreenView(),
        "ContributeScreen" : (_) => const ContributeScreenView(),
        "DecalogueScreen" : (_) => const DecalogueScreenView(),
        "EventsScreen" : (_) => const EventsScreenView(),
        "JoinUsScreen" : (_) => const JoinUsScreenView(),
        "OurTeamScreen" : (_) => const OurTeamScreenView(),
        "WhereWeAreScreen" : (_) => const WhereWeAreScreenView(),
        "WhoWeAreScreen" : (_) => const WhoWeAreScreenView(),
        "ManifestScreen" : (_) => const ManifestScreenView(),
        "TransparencyScreen" : (_) => const TransparencyScreenView(),
        "PostersScreen" : (_) => const PostersScreenView(),
      },
    );
  }


}