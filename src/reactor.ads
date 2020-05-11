with Speed;
use Speed;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package reactor with SPARK_Mode
is
   
   -- If overheat STOP
   
   type Thermometer is range 0..300;
   Temp : Thermometer;
   type Multimeter is range 0..1500;
   Multi : Multimeter;
   
   type Maintenance is (ON, OFF);
   Maint : Maintenance := OFF;
  
   
   
   -- If Maintenance is ON, reactor must be OFFLINE
   
   procedure MakeMaintenance (Maint : in out Maintenance) with
     
     Pre => Maint = OFF,
       
     Post => Maint = ON
     and Multi = Multimeter'First
     and Temp = Thermometer'First;
     
    procedure DoneMaintenance (Maint : in out Maintenance) with
     
     Pre => Maint = ON,
       
     Post => Maint = OFF;
    
    procedure Overheat with
        Global => (In_Out => (ActualSpeed, Stat)),
     Pre => ActualSpeed > Speedometer'First,
          
        Post => ActualSpeed = Speedometer'First;
      
   procedure Cooldown with
     Global => (Output => (Multi, Temp)),
          
     Post => Temp = Thermometer'First
    and Multi = Multimeter'First;
      
end reactor;
