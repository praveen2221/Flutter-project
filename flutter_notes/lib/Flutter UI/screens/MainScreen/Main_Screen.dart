import 'package:flutter/material.dart';

import '../../../APICalling/API_Calling.dart';
import '../../../Button _Widget/CircularProgressIndicator/ModernCircularProgressIndicator.dart';
import '../Bottom_sheet.dart';
import '../DataTable/Data_Table.dart';
import '../Expanded/Expanded.dart';
import '../Expansion Panel/ExpansionPanel.dart';
import '../GridView/Grid_View.dart';
import '../GridView/ListView.dart';
import '../Icons/Icons.dart';
import '../Images/Image.dart';
import '../LinearProgressBar/CircularProgressIndicator.dart';
import '../LinearProgressBar/LinearProgress_Bar.dart';
import '../LinearProgressBar/ModernCircularProgressIndicator.dart';
import '../ShowDailogBox/Popup_Screen.dart';
import '../ShowDailogBox/ShowDailog_Box.dart';
import '../Snack_Bar.dart';
import '../Stepper/stepper.dart';
import '../ToolTip/Tool_Tip.dart';
import '../card/Card.dart';
import '../chip/chip.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void onStepChange(int step) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Buttons(context, 'Bottom Sheet', const Bottomsheet()),
              Buttons(context, "PopUp Screen", const MyPopUpScreen()),
              Buttons(context, "ShowDailog Box", const MyShowDailogBox()),
              Buttons(context, 'Snack Bar', const MySnackBar()),
              Buttons(context, "Expansion Panel", const MyExpansionPanel()),
              Buttons(context, "Icons", const MyIcons()),
              Buttons(context, "Images", const MyImages()),
              Buttons(context, "chip", MyChip()),
              Buttons(context, "GridView", const MyGridView()),
              Buttons(context, "List View", const MyListView()),
              Buttons(context, "DataTable", const MyDataTable()),
              Buttons(context, "Expanded", const MyExpanded()),
              const Divider(
                thickness: 3,
                indent: 10,
                endIndent: 10,
              ),
              Buttons(context, "LinearProgessBar",
                  const ProgressIndicatorExample()),
              Buttons(context, "ToolTip", const TooltipSample()),
              Buttons(context, "Cart", const MyCard()),
              Buttons(context, "Stepper", const MyStepper()),
              Buttons(context, "CircularProgressIndicator",
                  const MyCircularProgressIndicator()),
              Buttons(context, "ModernCircularProgressIndicator",
                  const MyModernCircularProgressIndicator()),
              Buttons(context, "ApiCalling", const MyAPICalling()),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  TextButton Buttons(BuildContext context, String text, Widget widget) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget));
      },
      child: Text(text),
    );
  }
}
