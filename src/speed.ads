
package Speed with SPARK_Mode
is
   
   type Speedometer is range 0..150;
   ActualSpeed : Speedometer;
   MAXSpeed : constant Speedometer := 140;
   type CanGo is (Go, Stop);
   Stat : CanGo := Stop;
   
   type Wagonstate is (Mounted, Dismounted);
   type WagonLink is (Alone, Linked);
   
   type WagonsNumber is range 0..20;
   TotalWagons : WagonsNumber ;
   
   type Wagon is record
      Wstate : Wagonstate := Dismounted;
      Wlink : WagonLink := Alone;
   end record;
    
   type WagonsAttached is array (WagonsNumber) of Wagon;
   
   
   -- Train has as an absolute speed limit
   
   procedure Accelerate (Acceleratet : in Speedometer) with
     
     Global => (In_Out => (ActualSpeed,Stat), Input =>  TotalWagons),
     Pre => (ActualSpeed + Acceleratet) <= Speedometer'Last,
     
     Post => ActualSpeed <= Speedometer'Last
     and ActualSpeed = ActualSpeed'Old + Acceleratet - (Acceleratet*(Speedometer(TotalWagons)/Speedometer(30)));
   
   procedure Brake (Braket : in Speedometer) with
     Pre => (ActualSpeed - Braket) >= Speedometer'First
     and then ActualSpeed >= Speedometer'First,
       
     Post => ActualSpeed >= Speedometer'First
     and then ActualSpeed = ActualSpeed'Old - Braket + (Braket*(Speedometer(TotalWagons)/Speedometer(30)));
   
   procedure StopTrain with 
     Global => (In_Out => (ActualSpeed,  Stat)),
     Pre => ActualSpeed >= Speedometer'First,
         
       Post => ActualSpeed = Speedometer'First
     and Stat = Stop; 
   
   
   
   procedure AddWagon  (Wagons : in out WagonsAttached;
                       WagonI : in WagonsNumber) with
    
     Pre => TotalWagons > WagonsNumber'First 
     and TotalWagons < WagonsNumber'Last 
     and  Stat = Stop
     
     and Wagons(WagonI).Wlink = Alone
     and Wagons(WagonI).Wstate = Dismounted,
       
     Post => TotalWagons <= WagonsNumber'Last
     and TotalWagons = TotalWagons'Old + 1;
    
   procedure RemoveWagon (Wagons : in out WagonsAttached;
                          WagonI : in WagonsNumber) with
     
     Pre => TotalWagons > WagonsNumber'First
     and Stat = Stop
     and Wagons(WagonI).Wlink = Alone
     and Wagons(WagonI).Wstate = Mounted,
       
     Post =>TotalWagons >= WagonsNumber'First 
     and TotalWagons = TotalWagons'Old - 1;

   

end Speed;
