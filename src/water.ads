with Reactor;
use Reactor;
with Speed;
use Speed;
package Water with SPARK_Mode
is

   type SupplyLevel is range 0..100;
   
   
   type WaterTank is (Full, Normal, Empty);
   TankState : WaterTank := Empty;
   

     -- Increasing Water Supply
     
   procedure IncreaseLevel (WaterChanges : in SupplyLevel;
                            TankLevel : in out SupplyLevel;
                            Temp : in out Thermometer) with 
     
     Pre => Stat = Go and  ActualSpeed > 0  
      And TankLevel <= SupplyLevel'Last
     and TankLevel >= SupplyLevel'First
     and TankLevel  <= SupplyLevel'Last - WaterChanges
     and (Temp - (Temp*Thermometer(WaterChanges/100))) > Thermometer'First,
       
     Post => TankLevel  = TankLevel'Old + WaterChanges;
   
   
   -- Decreasing Water Supply
   
   procedure DecreaseLevel (WaterChanges : in SupplyLevel;
                            TankLevel : in out SupplyLevel;
                            Temp : in out Thermometer) with
     Pre => Stat = Go and  ActualSpeed > 0    
     And  TankState /= Empty
     and TankLevel > SupplyLevel'First
     and (TankLevel - WaterChanges) >= SupplyLevel'First
     and (Temp + (Temp*Thermometer(WaterChanges/100))) <= Thermometer'Last,
       
     Post => TankLevel  =  TankLevel'Old - WaterChanges;
   
end Water;
