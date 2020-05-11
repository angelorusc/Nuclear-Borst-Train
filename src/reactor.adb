with Speed;
use Speed;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package body Reactor with SPARK_Mode
is

   procedure MakeMaintenance (Maint : in Out Maintenance) is
      
   begin
      Maint := ON;
      ActualSpeed := Speedometer'First;
      Multi := Multimeter'First;
      Temp := Thermometer'First;
   end MakeMaintenance;
   
   procedure DoneMaintenance (Maint : in Out Maintenance) is
      
   begin
      Maint := OFF;
   end DoneMaintenance;

   
   -- If overheat STOP
   
   procedure Overheat is 
   begin 
         --Put_Line("WARNING!: The reactor is Overheating");
         StopTrain;
      
   end Overheat;
   
   procedure CoolDown is 
   begin 
      Temp := Thermometer'First;
      Multi := Multimeter'First;
      end CoolDown;
  
   
end Reactor;
