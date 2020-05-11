with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package body Speed  with SPARK_Mode
is

   
   -- Train has as an absolute speed limit
   
   procedure Accelerate (Acceleratet : in Speedometer) is
      
   begin
      if (ActualSpeed + Acceleratet) <= Speedometer'Last 
      then  
         ActualSpeed := ActualSpeed + Acceleratet - (Acceleratet*(Speedometer(TotalWagons)/Speedometer(30)));
      
         if Stat = Stop
         then
            Stat := Go;
         end if;
      end if;
      
   end Accelerate;
   
   procedure Brake (Braket : in Speedometer) is
   begin
      if ((ActualSpeed - Braket) >= Speedometer'First
          and ActualSpeed > 0
          and Braket > 0) then
         ActualSpeed := ActualSpeed - BrakeT + (Braket*(Speedometer(TotalWagons)/Speedometer(30)));
         
      end if;
   end Brake;
   
   procedure StopTrain is 
   begin 
      if (ActualSpeed >= 0)
      then
         ActualSpeed := ActualSpeed - ActualSpeed;
         Stat := Stop;
      end if;
   end StopTrain;
   
   procedure AddWagon (Wagons : in out WagonsAttached;
                       WagonI : in WagonsNumber) is
    
   begin
      if Stat = Stop and TotalWagons < WagonsNumber'Last
      then 
         if Wagons(WagonI).Wlink = Alone and Wagons(WagonI).Wstate = Dismounted
           then 
            Wagons(WagonI).Wstate := Mounted;
            TotalWagons := TotalWagons + 1;
            Put_Line("Wagon " & WagonI'Image & " Added");
            if WagonI > 1
              then
               Wagons(WagonI - 1).Wlink := Linked;
            end if; 
         else 
            Put_Line ("The carriage cannot be mounted as it's linked to another wagon.");
          end if;
      else 
         Put_Line ("The carriage cannot be mounted as the train is moving.");
         end if;
     
      end AddWagon;
     
   
   -- Remove Wagon
    
    procedure RemoveWagon (Wagons : in out WagonsAttached;
                          WagonI : in WagonsNumber) is
   begin 
      if Stat = STOP and TotalWagons > WagonsNumber'First
      then
         if Wagons(WagonI).Wlink = Alone and Wagons(WagonI).Wstate = Mounted
         then 
            Wagons(WagonI).Wstate := Dismounted;
            TotalWagons := TotalWagons - 1;
          if WagonI > 1
              then
               Wagons(WagonI - 1).Wlink := Alone;
            end if;  
         
         else
         Put_Line ("The carriage cannot be dimounted if linked to more than one wagon.");       
        end if ;
         else 
         Put_Line ("The carriage cannot be dismounted as the train is moving.");
      end if;
   
      end RemoveWagon;
   
end Speed;
