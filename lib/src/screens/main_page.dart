import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:insta_clone/src/CRUDs/CRUDExpressedModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDFeedingModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDFormulaModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDGrowModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDJoyModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDMedicationModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDNappyChangeModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDOtherModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDPumpingModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDSleepModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDSuplimentModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDTemperatureModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDVaccinationModel.dart';
import 'package:insta_clone/src/models/baseAuth.dart';
import 'package:insta_clone/src/models/expressed.dart';
import 'package:insta_clone/src/models/feeding.dart';
import 'package:insta_clone/src/models/formula.dart';
import 'package:insta_clone/src/models/growth.dart';
import 'package:insta_clone/src/models/joy.dart';
import 'package:insta_clone/src/models/medication.dart';
import 'package:insta_clone/src/models/nappy-change.dart';
import 'package:insta_clone/src/models/others.dart';
import 'package:insta_clone/src/models/pumping.dart';
import 'package:insta_clone/src/models/sleep.dart';
import 'package:insta_clone/src/models/supliment.dart';
import 'package:insta_clone/src/models/temperature.dart';
import 'package:insta_clone/src/models/vaccination.dart';
import 'package:insta_clone/src/screens/main/tab-charts.dart';
import 'package:insta_clone/src/screens/main/tab-event.dart';
import 'package:insta_clone/src/screens/main/tab-main.dart';
import 'package:insta_clone/src/widgets/user_image_with_plus_icon.dart';
import 'package:insta_clone/src/screens/create_or_edit_baby.dart';
import 'package:insta_clone/src/models/baby.dart';

class Profile extends StatefulWidget {
  @override
  final Baby baby;
  final BaseAuth auth;
  Profile({Key key, @required this.baby, this.auth}) : super(key: key);
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {

  List<NappyChange> nappyChangeList = new List<NappyChange>();
  List<Feeding> feedingList = new List<Feeding>();
  List<Expressed> expressedList = new List<Expressed>();
  List<Formula> formulaList = new List<Formula>();
  List<Supliment> suplimentList = new List<Supliment>();
  List<SleepModel> sleepList = new List<SleepModel>();
  List<PumpingModel> pumpingList = new List<PumpingModel>();
  List<TemperatureModel> temperatureList = new List<TemperatureModel>();
  List<VaccinationModel> vaccinationList = new List<VaccinationModel>();
  List<MedicationModel> medicationList = new List<MedicationModel>();
  List<JoyModel> joyList = new List<JoyModel>();
  List<GrowthModel> growthList = new List<GrowthModel>();
  List<OtherModel> otherList = new List<OtherModel>();
  TabController _tabController;
  ScrollController _scrollController;
  int fCount = 0;
  int nCount = 0;
  int sCount = 0;
  int pCount = 0;
  int oCount = 0;
  CRUDNappyChangeModel nappyChange = new CRUDNappyChangeModel();
  CRUDFeedingModel feeding = new CRUDFeedingModel();
  CRUDExpressedModel expressed = new CRUDExpressedModel();
  CRUDFormulaModel formula = new CRUDFormulaModel();
  CRUDSuplimentModel supliment = new CRUDSuplimentModel();
  CRUDSleepModel sleep = new CRUDSleepModel();
  CRUDPumpingModel pumping = new CRUDPumpingModel();
  CRUDTemperatureModel temperature = new CRUDTemperatureModel();
  CRUDVaccinationModel vaccination = new CRUDVaccinationModel();
  CRUDMedicationModel medication = new CRUDMedicationModel();
  CRUDJoyModel joy = new CRUDJoyModel();
  CRUDGrowthModel growth = new CRUDGrowthModel();
  CRUDOtherModel other = new CRUDOtherModel();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _scrollController = ScrollController();
    _getCounts();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {},
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(child: userInfo()),
              SliverPersistentHeader(
                delegate: CustomSliverDelegate(_tabController),
                pinned: true,
                floating: true,
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              MainTab(baby: widget.baby, callback: _getCounts()),
              EventTab(
                baby: widget.baby,
                nappyChangeList: nappyChangeList,
                feedingList: feedingList,
                expressedList: expressedList, 
                formulaList: formulaList, 
                suplimentList: suplimentList, 
                sleepList: sleepList,
                pumpingList: pumpingList,
                temperatureList: temperatureList,
                vaccinationList: vaccinationList,
                medicationList: medicationList,
                joyList: joyList,
                growthList: growthList,
                otherList: otherList),
              ChartTab(baby: widget.baby),
            ],
          ),
        ),
      ),
    );
  }


  Widget stats(String statName, int count) {
    return Column(
      children: <Widget>[
        Text(
          count.toString(),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(statName),
      ],
    );
  }

  _getCounts(){
    fCount = 0;
    nCount = 0;
    sCount = 0;
    pCount = 0;
    oCount = 0;
    nappyChange.getNappyChangeByUserId(widget.baby.id).then((data){
      setState(() {
        nappyChangeList = data;
        nCount = data.length;
      });
    });
    sleep.getSleepModelByUserId(widget.baby.id).then((data){
      setState(() {
        sleepList = data;
        sCount = data.length;
      });
    });
    pumping.getPumpingModelByUserId(widget.baby.id).then((data){
      setState(() {
        pumpingList = data;
        pCount = data.length;
      });
    });
    feeding.getFeedingByUserId(widget.baby.id).then((data){
      setState(() {
        feedingList = data;
        fCount += data.length;
      });
    });
    expressed.getExpressedByUserId(widget.baby.id).then((data){
      setState(() {
        expressedList = data;
        fCount += data.length;
      });
    });
    formula.getFormulaByUserId(widget.baby.id).then((data){
      setState(() {
        formulaList = data;
        fCount += data.length;
      });
    });
    supliment.getSuplimentByUserId(widget.baby.id).then((data){
      setState(() {
        suplimentList = data;
        fCount += data.length;
      });
    });
    temperature.getTemperatureModelByUserId(widget.baby.id).then((data){
      setState(() {
        temperatureList = data;
        oCount += data.length;
      });
    });
    vaccination.getVaccinationModelByUserId(widget.baby.id).then((data){
      setState(() {
        vaccinationList = data;
        oCount += data.length;
      });
    });
    medication.getMedicationModelByUserId(widget.baby.id).then((data){
      setState(() {
        medicationList = data;
        oCount += data.length;
      });
    });
    growth.getGrowthModelByUserId(widget.baby.id).then((data){
      setState(() {
        growthList = data;
        oCount += data.length;
      });
    });
    joy.getJoyModelByUserId(widget.baby.id).then((data){
      setState(() {
        joyList = data;
        oCount += data.length;
      });
    });
    other.getOtherModelByUserId(widget.baby.id).then((data){
      setState(() {
        otherList = data;
        oCount += data.length;
      });
    });
  }

  Widget userInfo() {
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border(
          bottom: BorderSide(
            color: Colors.black26,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                UserImageWithPlusIcon(baby: widget.baby, auth: widget.auth,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            stats('Feeding', fCount),
                            stats('Nappy Change', nCount),
                            stats('Sleep', sCount),
                          ]
                        ),

                        ),
                        Container(
                        margin: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            stats('Pumping', pCount),
                            stats('Other Activity', oCount),
                          ]
                        ),
                      ),
                    ]
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              '${widget.baby.name}',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              '${widget.baby.birthDate.day}/${widget.baby.birthDate.month}/${widget.baby.birthDate.year}',
              style: TextStyle(),
            ),
            // Edit profile button
            
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Babys(baby: Baby("","","","",DateTime.now(),false), auth: widget.auth,)),
                );
              },
              child: Container(
              
              width: double.infinity,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black26,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Add new Baby',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ),
            // For padding
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

// Tab bar
class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  TabController _tabController;
  CustomSliverDelegate(this._tabController);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.grey[50],
      ),
      child: TabBar(
        controller: _tabController,
        indicatorColor: Colors.black,
        tabs: <Widget>[
          Icon(Icons.list),
          Icon(Icons.view_list),
          Icon(Icons.insert_chart),
        ],
      ),
    );
  }
  @override
  double get maxExtent => 50.0;

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
