with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Reactor;
use Reactor;
with Speed;
use Speed;

package ControlRods 
with SPARK_Mode
is
   
   type RodState is (Inserted, NotInserted); 
   
   type RodPerc is range 0..100;
 
   type Rod_Index is range 1..5;
     
   type Rod is record 
      RState : RodState := Inserted;
      RPerc : RodPerc := 100;
   end record;
   
   type Rods is array (Rod_Index) of Rod;
   RodsArray : Rods;
   
     -- The train must have at least one rod inserted at all times
     
   function MustOne (D: in Rods)  return Boolean is 
      (for Some I in D'Range => D(I).RState= Inserted and D(I).RPerc = RodPerc(100));
      
  
   
   procedure InsertRod (Ind : in Rod_Index;
                        Perc : in RodPerc;
                        CurrentElectricity : in out Multimeter) with 
     Global => (In_Out => (Temp, RodsArray, ActualSpeed, File_System), Input => (Maint, TotalWagons)),
       
     Pre =>  RodsArray(Ind).RPerc < RodPerc'Last 
     and RodPerc'Last - Perc >= RodsArray(Ind).RPerc
     and Temp - ((Thermometer(Perc)) * Thermometer(0.75)) >= Thermometer'First 
     and CurrentElectricity - (Multimeter(Perc) * Multimeter(2.5)) >= Multimeter'First
     and ActualSpeed - ((Speedometer(Perc)) * Speedometer(4) / Speedometer(10)) + (((Speedometer(Perc)) * Speedometer(4) / Speedometer(10))*(Speedometer(TotalWagons)/Speedometer(30))) >= Speedometer'First ,
    
     
     Post => CurrentElectricity <= CurrentElectricity'Old
     and Temp <= Temp'Old;

   
   procedure RemoveRod (Ind : in Rod_Index;
                        Perc : in RodPerc;
                        CurrentElectricity : in out Multimeter) with
     Global => (In_Out => (Temp, RodsArray, ActualSpeed, Stat, File_System, Multi), Input =>  (Maint, TotalWagons)),
     
     Pre => Maint = OFF
     and CurrentElectricity + (Multimeter(Perc) * Multimeter(2.5)) < Multimeter'Last
     and TEMP + Thermometer(Perc) * Thermometer(0.75) < Thermometer'Last
     and ActualSpeed + Speedometer(Perc) * Speedometer(5) / Speedometer(10) < Speedometer'Last,
     
     
     Post => CurrentElectricity >= CurrentElectricity'Old
     and Temp >= Temp'Old;
   
  procedure InsertAll; 
       
   
end ControlRods;
