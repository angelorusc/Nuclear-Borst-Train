with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Reactor;
use Reactor;
with Speed;
use Speed;

package body ControlRods 
with SPARK_Mode
is
   
   procedure InsertRod (Ind : in Rod_Index;
                        Perc : in RodPerc;
                        CurrentElectricity : in out Multimeter) is
      
      LessHeat : Thermometer := (Thermometer(Perc)) * Thermometer(0.75);
      LessElectricty : Multimeter := (Multimeter(Perc)) * Multimeter(2.5);
      LessSpeed : Speedometer := (Speedometer(Perc)) * Speedometer(4) / Speedometer(10);
      
   begin
      if Maint = OFF
      then     
         if RodsArray(Ind).RState = NotInserted and  RodsArray(Ind).RPerc = 0
         then 
            if (Temp - LessHeat >= Thermometer'First)
            then
               if (CurrentElectricity - LessElectricty >= Multimeter'First) 
                then 
                  if ActualSpeed > Speedometer'First and (ActualSpeed - LessSpeed) >= Speedometer'First
                  then
                     Temp := Temp - LessHeat;
                     CurrentElectricity := CurrentElectricity - LessElectricty;
                     Brake(LessSpeed);
                     RodsArray(Ind).RState := Inserted;
                     RodsArray(Ind).RPerc := Perc + RodsArray(Ind).RPerc;
                  else 
                     ActualSpeed := Speedometer'First;
                  end if;
               else
                  CurrentElectricity := Multimeter'First;
               end if;
            else
               Temp := Thermometer'First;
            end if;
         elsif RodsArray(Ind).RPerc < RodPerc'Last and  RodsArray(Ind).RPerc + Perc <= RodPerc'Last
           then
                     Temp := Temp - LessHeat;
                     CurrentElectricity := CurrentElectricity - LessElectricty;
                     Brake(LessSpeed);
                     RodsArray(Ind).RPerc := RodsArray(Ind).RPerc + Perc ;
--                 
            else Put_Line("The Selected Rod is Fully Inserted!!");
         end if;
      else
          Put_Line("Maintenance is ON!!");
      end if;  
   end InsertRod;
   
   
   
   procedure RemoveRod (Ind : in Rod_Index;
                        Perc : in RodPerc;
                        CurrentElectricity : in out Multimeter) is
      MoreHeat : Thermometer := Thermometer(Perc) * Thermometer(0.75);
      MoreElectricty : Multimeter :=  Multimeter(Perc) * Multimeter(2.5);
      MoreSpeed : Speedometer := Speedometer(Perc) * Speedometer(4) / (Speedometer(10));
      
   begin 
      
      if Maint = OFF
      then
         if RodsArray(Ind).RState = Inserted 
            then 
         
             if (Temp + MoreHeat) <= Thermometer'Last 
             then
            
             if (CurrentElectricity + MoreElectricty) > Multimeter'Last
               then 
                 Put_Line("The Reactor is generating too much Electricity");
                    else
                 if (ActualSpeed + MoreSpeed) > MAXSpeed
                  then
                     Put_Line("The Train has reached Max Speed to be retained safe");
                    else
                     Temp := Temp + MoreHeat;
                     CurrentElectricity := CurrentElectricity + MoreElectricty;
                     Accelerate(MoreSpeed);
                     Put_Line(Ind'Image & "º Rod Removed of " & Integer(Perc)'Image&"%");
            
                     if (RodsArray(Ind).RPerc - Perc) > RodPerc'First
                     then
                        RodsArray(Ind).RPerc := RodsArray(Ind).RPerc - Perc;
                     else
                        RodsArray(Ind).RState := NotInserted;
                        RodsArray(Ind).RPerc := RodPerc'First;
                        Put_Line(Ind'Image & "º Rod Removed totally");
                     end if;
                     
                     if MustOne(RodsArray) = False
                     then
                     Temp := Temp - MoreHeat;
                     CurrentElectricity := CurrentElectricity - MoreElectricty;
                     ActualSpeed := ActualSpeed - MoreSpeed + (MoreSpeed*(Speedometer(TotalWagons)/Speedometer(30)));
                        if (RodsArray(Ind).RPerc - Perc) > RodPerc'First
                        then
                        RodsArray(Ind).RPerc := RodsArray(Ind).RPerc + Perc;
                        else
                        RodsArray(Ind).RState := Inserted;
                        RodsArray(Ind).RPerc := RodsArray(Ind).RPerc + Perc;
                        end if;
                     Put_Line("One Rod must always fully Inserted"); 
                     end if;
                     
                     end if;
                  end if;
                  
             else
               Overheat;
                  Put_Line("WARNING!: The System is OVERHEATING");
                  Put_Line(" The System is Cooling down");
                  Cooldown;
             end if;
         else
         Put_Line("The ROD is already been removed");
         end if;
      else
      Put_Line("MAINTENANCE IS ON!!");
      end if;
         
        
   end RemoveRod;   
      
   
   procedure InsertAll is 
   begin 
      RodsArray(1).RState := Inserted;
      RodsArray(1).RPerc := 100;
       RodsArray(2).RState := Inserted;
      RodsArray(2).RPerc := 100;
       RodsArray(3).RState := Inserted;
      RodsArray(3).RPerc := 100;
       RodsArray(4).RState := Inserted;
      RodsArray(4).RPerc := 100;
       RodsArray(5).RState := Inserted;
      RodsArray(5).RPerc := 100;
      end InsertAll;
end ControlRods;
