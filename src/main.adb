
with ControlRods; use ControlRods;
with Reactor; use Reactor;
with Speed;
use Speed;

with Water; use Water;
with Ada.Text_IO; use Ada.Text_IO;
with GNAT.OS_Lib;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;


procedure Main is
   Wag : WagonsAttached;
   R : String(1..1);
   CF: String(1..2);
   W : String(1..2);
   Perc : String (1..3);
   Water : String(1..3);
   Len : Natural;

   Supply : SupplyLevel := 0;
   procedure Resettrain is
   begin
      Temp := Thermometer'First;
      Multi := Multimeter'First;
      Maint := Off;
      ActualSpeed := Speedometer'First;
      Stat := Stop;
      TotalWagons:= WagonsNumber'First;
      Supply := SupplyLevel'First;
      InsertAll;
   end Resettrain;


   procedure RodsImage(Perc : In RodPerc) is

   begin
      if Perc <= 100 and Perc > 90
      then Put("                    || = | = | = | = | = | = | = | = | = |=> ||");
      elsif Perc <= 90 and Perc > 80
      then Put("                  o=|| = | = | = | = | = | = | = | = |=> |   ||");
         elsif Perc <= 80 and Perc > 70
      then Put("                 o==|| = | = | = | = | = | = | = |=> |   |   ||");
         elsif Perc <= 70 and Perc > 60
      then Put("                o===|| = | = | = | = | = | = |=> |   |   |   ||");
         elsif Perc <= 60 and Perc > 50
      then Put("               o====|| = | = | = | = | = |=> |   |   |   |   ||");
         elsif Perc <= 50 and Perc > 40
      then Put("              o=====|| = | = | = | = |=> |   |   |   |   |   ||");
         elsif Perc <= 40 and Perc > 30
      then Put("             o======|| = | = | = |=> |   |   |   |   |   |   ||");
         elsif Perc <= 30 and Perc > 20
      then Put("            o=======|| = | = |=> |   |   |   |   |   |   |   ||");
         elsif Perc <= 20 and Perc > 10
      then Put("           o========|| = |=> |   |   |   |   |   |   |   |   ||");
         elsif Perc <= 10 and Perc > 0
      then Put("          o=========||=> |   |   |   |   |   |   |   |   |   ||");
         elsif Perc = 0
      then Put("    o==========>||   |   |   |   |   |   |   |   |   |   ||");
      end if;
   end RodsImage;

   procedure WaterImage(WatPerc : in SupplyLevel) is
      BEGIN
      if WatPerc <= 100 and WatPerc > 90
      Then
       Put_Line("100L|||\/\/\/\/\|||                                                        |~~~|  ");
       Put_Line("     ||~~~~~~~~~||                                                     ____|~~~|  ");
       Put_Line("     ||~~~~~~~~~||                                                    /~~~~~~~~|  ");
       Put_Line("     ||~~~~~~~~~||                                                   |~~~ _____/   ");
       Put_Line("     ||~~~~~~~~~||                                                   |~~~|  ");
       Put_Line("     ||~~~~~~~~~||                                                   |~~~|  ");
       Put_Line("     ||~~~~~~~~~||                                                   |~~~|  ");
       Put_Line("     ||~~~~~~~~~||__________________________________________________/~~~~|  ");
       Put_Line("     ||~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/ ");
       Put_Line("     ||~~~~~~~~~  ______________________________________________________/ ");
       Put_Line("     \\_________//  ");
      elsif WatPerc <= 90 and WatPerc > 80
      then
       Put_Line("    |||         |||                                                       |~~~|  ");
       Put_Line(" 90L ||\/\/\/\/\||                                                    ____|~~~|  ");
       Put_Line("     ||~~~~~~~~~||                                                   /~~~~~~~~|  ");
       Put_Line("     ||~~~~~~~~~||                                                   |~~~ ____/   ");
       Put_Line("     ||~~~~~~~~~||                                                   |~~~|  ");
       Put_Line("     ||~~~~~~~~~||                                                   |~~~|  ");
       Put_Line("     ||~~~~~~~~~||                                                   |~~~|  ");
       Put_Line("     ||~~~~~~~~~||__________________________________________________/~~~~|  ");
       Put_Line("     ||~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/ ");
       Put_Line("     ||~~~~~~~~~  ______________________________________________________/ ");
       Put_Line("     \\_________//  ");
         elsif WatPerc <= 80 and WatPerc > 70
      then
       Put_Line("    |||         |||                                                        |~~~|  ");
       Put_Line("     ||         ||                                                     ____|~~~|  ");
       Put_Line(" 80L ||\/\/\/\/\||                                                    /~~~~~~~~|  ");
       Put_Line("     ||~~~~~~~~~||                                                   |~~~ _____/   ");
       Put_Line("     ||~~~~~~~~~||                                                   |~~~|  ");
       Put_Line("     ||~~~~~~~~~||                                                   |~~~|  ");
       Put_Line("     ||~~~~~~~~~||                                                   |~~~|  ");
       Put_Line("     ||~~~~~~~~~||__________________________________________________/~~~~|  ");
       Put_Line("     ||~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/ ");
       Put_Line("     ||~~~~~~~~~ _______________________________________________________/ ");
       Put_Line("     \\_________//  ");
         elsif WatPerc <= 70 and WatPerc > 60
      then
       Put_Line("    |||         |||                                                        |~~~|  ");
       Put_Line("     ||         ||                                                     ____|~~~|  ");
       Put_Line("     ||         ||                                                    /~~~~~~~~|  ");
       Put_Line(" 70L ||\/\/\/\/\||                                                   |~~~ _____/   ");
       Put_Line("     ||~~~~~~~~~||                                                   |~~~|  ");
       Put_Line("     ||~~~~~~~~~||                                                   |~~~|  ");
       Put_Line("     ||~~~~~~~~~||                                                   |~~~|  ");
       Put_Line("     ||~~~~~~~~~||__________________________________________________/~~~~|  ");
       Put_Line("     ||~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/ ");
       Put_Line("     ||~~~~~~~~~  ______________________________________________________/ ");
       Put_Line("     \\_________//  ");
         elsif WatPerc <= 60 and WatPerc > 50
      then
       Put_Line("    |||         |||                                                        |~~~|  ");
       Put_Line("     ||         ||                                                     ____|~~~|  ");
       Put_Line("     ||         ||                                                    /~~~~~~~~|  ");
       Put_Line("     ||         ||                                                   |~~~ _____/   ");
       Put_Line(" 60L ||\/\/\/\/\||                                                   |~~~|  ");
       Put_Line("     ||~~~~~~~~~||                                                   |~~~|  ");
       Put_Line("     ||~~~~~~~~~||                                                   |~~~|  ");
       Put_Line("     ||~~~~~~~~~||__________________________________________________/~~~~|  ");
       Put_Line("     ||~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/ ");
       Put_Line("     ||~~~~~~~~~  ______________________________________________________/ ");
       Put_Line("     \\_________//  ");
         elsif WatPerc <= 50 and WatPerc > 40
      then
       Put_Line("    |||         |||                                                        |~~~|  ");
       Put_Line("     ||         ||                                                     ____|~~~|  ");
       Put_Line("     ||         ||                                                    /~~~~~~~~|  ");
       Put_Line("     ||         ||                                                   |~~~ _____/   ");
       Put_Line("     ||         ||                                                   |~~~|  ");
       Put_Line(" 50L ||\/\/\/\/\||                                                   |~~~|  ");
       Put_Line("     ||~~~~~~~~~||                                                   |~~~|  ");
       Put_Line("     ||~~~~~~~~~||__________________________________________________/~~~~|  ");
       Put_Line("     ||~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/ ");
       Put_Line("     ||~~~~~~~~~  ______________________________________________________/ ");
       Put_Line("     \\_________//  ");
         elsif WatPerc <= 40 and WatPerc > 30
      then
       Put_Line("    |||         |||                                                        |~~~|  ");
       Put_Line("     ||         ||                                                     ____|~~~|  ");
       Put_Line("     ||         ||                                                    /~~~~~~~~|  ");
       Put_Line("     ||         ||                                                   |~~~ _____/   ");
       Put_Line("     ||         ||                                                   |~~~|  ");
       Put_Line("     ||         ||                                                   |~~~|  ");
       Put_Line(" 40L ||\/\/\/\/\||                                                   |~~~|  ");
       Put_Line("     ||~~~~~~~~~||__________________________________________________/~~~~|  ");
       Put_Line("     ||~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/ ");
       Put_Line("     ||~~~~~~~~~  ______________________________________________________/ ");
       Put_Line("     \\_________//  ");
      elsif WatPerc <= 30 and WatPerc > 20
      then
       Put_Line("    |||         |||                                                        |~~~|  ");
       Put_Line("     ||         ||                                                     ____|~~~|  ");
       Put_Line("     ||         ||                                                    /~~~~~~~~|  ");
       Put_Line("     ||         ||                                                   |~~~ _____/   ");
       Put_Line("     ||         ||                                                   |~~~|  ");
       Put_Line("     ||         ||                                                   |~~~|  ");
       Put_Line("     ||         ||                                                   |~~~|  ");
       Put_Line(" 30L ||\/\/\/\/\||__________________________________________________/~~~~|  ");
       Put_Line("     ||~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/ ");
       Put_Line("     ||~~~~~~~~~  ______________________________________________________/ ");
       Put_Line("     \\_________//  ");
         elsif WatPerc <= 20 and WatPerc > 10
      then
       Put_Line("    |||         |||                                                        |~~~|  ");
       Put_Line("     ||         ||                                                    _____|~~~|  ");
       Put_Line("     ||         ||                                                   /~~~~~~~~~|  ");
       Put_Line("     ||         ||                                                   |~~~ _____/   ");
       Put_Line("     ||         ||                                                   |~~~|  ");
       Put_Line("     ||         ||                                                   |~~~|  ");
       Put_Line("     ||         ||                                                   |~~~|  ");
       Put_Line("     ||         ||__________________________________________________/~~~~|  ");
       Put_Line(" 20L ||/\/\/\/\/\~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/ ");
       Put_Line("     ||~~~~~~~~~~_______________________________________________________/ ");
       Put_Line("     \\_________//  ");
         elsif WatPerc <= 10 and WatPerc > 0
      then
       Put_Line("    |||         |||                                                        |~~~|  ");
       Put_Line("     ||         ||                                                     ____|~~~|  ");
       Put_Line("     ||         ||                                                    /~~~~~~~~|  ");
       Put_Line("     ||         ||                                                   |~~~ _____/   ");
       Put_Line("     ||         ||                                                   |~~~|  ");
       Put_Line("     ||         ||                                                   |~~~|  ");
       Put_Line("     ||         ||                                                   |~~~|  ");
       Put_Line("     ||         ||__________________________________________________/~~~~|  ");
       Put_Line("     ||          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/ ");
       Put_Line(" 10L ||/\/\/\/\/\_______________________________________________________/ ");
       Put_Line("     \\_________//  ");
         elsif WatPerc = 0
   Then
       Put_Line("    |||         |||                                                   _____|   |  ");
       Put_Line("     ||         ||                                                   /         |  ");
       Put_Line("     ||         ||                                                  |    ______/   ");
       Put_Line("     ||         ||                                                  |   |  ");
       Put_Line("     ||         ||                                                  |   |  ");
       Put_Line("     ||         ||                                                  |   |  ");
       Put_Line("     ||         ||                                                  |   |  ");
       Put_Line("     ||         ||_________________________________________________/    |  ");
       Put_Line("     ||                                                                 / ");
       Put_Line(" 0L  ||          ______________________________________________________/ ");
       Put_Line("     \\_________//  ");
   end if;
   end WaterImage;
   procedure Bridge Is
   begin
      New_Line;
      Put_Line("== TRAIN BRIDGE ========================================================================");
      New_Line;
   Put_Line("# CARRIAGES : " & TotalWagons'Image);
   Put_Line("# STATE: " & Stat'Image);
   Put_Line("# SPEED: " & ActualSpeed'Image & "Km/h");
   Put_Line("# MAINTENANCE: " & Maint'Image);
      New_Line;
      Put_Line("== REACTOR ==============================================================================");
      --New_Line;
      Put_Line("           # TEMPERATURE: " & Temp'Image & "°C  # ELECTRICITY: " & Multi'Image & "Kw");
    --  Put_Line("      ROD-STATE||                     || 10| 20| 30| 40| 50| 60| 70| 80| 90|100|| %");
      Put_Line("                                      ___________________________________________");
      Put("ROD1: " & RodsArray(1).RState'Image & " || " ); RodsImage(RodsArray(1).RPerc); Put_Line(RodsArray(1).RPerc'Image & "%");
      Put("ROD2: " & RodsArray(2).RState'Image & " || " ); RodsImage(RodsArray(2).RPerc); Put_Line(RodsArray(2).RPerc'Image & "%");
      Put("ROD3: " & RodsArray(3).RState'Image & " || " ); RodsImage(RodsArray(3).RPerc); Put_Line(RodsArray(3).RPerc'Image & "%");
      Put("ROD4: " & RodsArray(4).RState'Image & " || " ); RodsImage(RodsArray(4).RPerc); Put_Line(RodsArray(4).RPerc'Image & "%");
      Put("ROD5: " & RodsArray(5).RState'Image & " || " ); RodsImage(RodsArray(5).RPerc); Put_Line(RodsArray(5).RPerc'Image & "%");
      Put_Line("                                      ___________________________________|~~~~~~~|");
      Put_Line("                                                                          \~~~~~/");
      Put_Line("                                                                           |~~~|");
      Put_Line("                                                                           |~~~|");
      Put_Line("== WATER SUPPLY ===========================================================|~~~|=========");
      Put_Line("                                                                           |~~~|");
      WaterImage(Supply);
   end Bridge;

   procedure Functions is
   begin
      New_Line;
      Put_Line("== TRAIN FUNCTIONS ======================================================================");
      New_Line;
      Put_Line("1) Add Wagon"& "           6) Decrease Water Supply");
      Put_Line("2) Remove Wagon"& "        7) Insert Rod");
      Put_Line("3) Start Train"& "         8) Remove Rod" );
      Put_Line("4) Stop Train"& "          9) Make Maintenance");
      Put_Line("5) Raise Water Supply"& "  10) Done Maintenance");
      New_Line;
      Put_Line("              11) EXIT");
      Put_Line("           12) RESET TRAIN");
   --Put_Line("..........................................................................................");
      New_Line;
      Put_Line("Which function would you like the train to performs ?");

   Get_Line(CF, Len);
   end Functions;

begin
   while True Loop
   Bridge;
   Functions;
        if (CF(1..Len)="1")
      then
         Put_Line("Please enter the Wagon's Number you want to ADD");
         Get_Line(W,Len);
         Put_Line("Adding a wagon to the train...");
         delay 0.5;
         AddWagon(Wag, WagonsNumber'Value(W(1..Len)));
         delay 1.5;


      elsif (CF(1..Len)="2")
         then
            Put_Line("Please enter the Wagon's Number you want to REMOVE");
            Get_Line(W,Len);
         Put_Line("Removing the wagon from the train...");
         delay 0.5;
         RemoveWagon(Wag, WagonsNumber'Value(W(1..Len)));
         delay 2.0;

      elsif (CF(1..Len)="3")
      then
        Put_Line("Starting the Train..");
         Put_Line("Input the ROD number you desire to manage: 1, 2, 3, 4, 5");
         Get(R);
         Skip_Line;
         Put_Line("Input how much you want to pull out the selected rod from 1 to 100%");
         Get_Line(Perc,Len);
         Put_Line("Removing Rod...");
         delay 1.0;
         RemoveRod(Rod_Index'Value(R),RodPerc'Value(Perc(1..Len)), Multi);
         delay 1.0;

      elsif (CF(1..Len)="4")
      then
         Put_Line("Stopping the Train..");
         delay 1.0;
         StopTrain;
         Temp := Temp - Temp;
         Multi := Multi - Multi;
         InsertAll;
         Put_Line("Train Stopped");
         delay 1.0;

      elsif (CF(1..Len)="5")
      then
         Put_Line("How much water you want to raise from 0 to 100");
         Get_Line(Water,Len);
         Put_Line("Raising the water supply...");
         delay 1.0;
         IncreaseLevel(SupplyLevel'Value(Water(1..Len)), Supply, Temp);
         Put_Line("Water Supply raised of " & Water(1..Len));
         delay 1.0;

      elsif (CF(1..Len)="6")
      then
         Put_Line("How much water you want to decrease from 0 to " & Supply'Image);
         Get_Line(Water,Len);
         Put_Line("Decreasing the water supply...");
         delay 1.0;
         DecreaseLevel(SupplyLevel'Value(Water(1..Len)), Supply, Temp);
         Put_Line("Water Supply decreased of " & Water(1..Len));
         delay 1.0;

      elsif (CF(1..Len)="7")
      then
         Put_Line("Input the ROD number you desire to manage: 1, 2, 3, 4, 5");
         Get(R);
         Skip_Line;
           Put_Line("Input how much more you want insert the selected rod from 1 to 100%");
         Get_Line(Perc,Len);
         Put_Line("Inserting Rod...");
         InsertRod(Rod_Index'Value(R), RodPerc'Value(Perc(1..Len)), Multi);
         delay 1.5;

      elsif (CF(1..Len)="8")
      then
         Put_Line("Input the ROD number you desire to manage: 1, 2, 3, 4, 5");
         Get(R);
         Skip_Line;
           Put_Line("Input how much you want to pull out the selected rod from 1 to 100%");
         Get_Line(Perc,Len);
         Put_Line("Removing Rod..");
         RemoveRod(Rod_Index'Value(R), RodPerc'Value(Perc(1..Len)), Multi);
         delay 1.5;

      elsif (CF(1..len)="9")
      then
         Put_Line("Maintenance Mode is switching on..");
         delay 1.0;
         MakeMaintenance(Maint);
         Put_Line("THE TRAIN IS IN MAINTENANCE MODE");
         delay 1.0;

      elsif (CF(1..Len)="10")
      then
         Put_Line("Maintenance Mode is switching off..");
         delay 1.0;
         DoneMaintenance(Maint);
         Put_Line("THE TRAIN IS NOT ANYMORE IN MAINTENANCE");
         delay 1.0;

      elsif (CF(1..Len)="11")
      then
         Put_Line("Exiting..");
         delay 1.0;
         GNAT.OS_Lib.OS_Exit (0);

     elsif (CF(1..Len)="12")
      then
         Put_Line("Resetting the Train..");
         delay 1.0;
         Resettrain;
      end if;
      Ada.Text_IO.Put(ASCII.ESC & "[2J");
      end loop;


   null;
end Main;
