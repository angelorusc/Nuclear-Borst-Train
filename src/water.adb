with reactor;
use reactor;
with Speed;
use Speed;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package body Water with SPARK_Mode
is
   
   procedure IncreaseLevel (WaterChanges : in SupplyLevel;
                            TankLevel : in out SupplyLevel;
                            Temp : in out Thermometer) is
      TempChange : Thermometer := (Temp*Thermometer(WaterChanges)/Thermometer(100));
   begin 
      if TankLevel = SupplyLevel'Last
      then
         TankState := Full;
      else   
        
         TankLevel := TankLevel + WaterChanges;
         Temp := Temp - TempChange;
            TankState := Normal;
           
      end if;
      
   end IncreaseLevel;
     
       
   procedure DecreaseLevel  (WaterChanges : in SupplyLevel;
                             TankLevel : in out SupplyLevel;
                             Temp : in out Thermometer) is
      TempChange : Thermometer := (Temp*Thermometer(WaterChanges)/Thermometer(100));
   begin
       if TankLevel > SupplyLevel'First
      then 
         TankLevel := TankLevel - WaterChanges;
         TankState := Normal;
         if (Temp + TempChange) <= Thermometer'Last 
           then
            Temp := Temp + TempChange;
         else
            Overheat;
             
         end if;
         
         if TankLevel = SupplyLevel'First
      then
            TankState := Empty;
            end if;
      end if;
   end DecreaseLevel;
   
end Water;
