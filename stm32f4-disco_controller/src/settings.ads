with Ada.Real_Time;
with Gcode;

package Settings is

   Idle_Stepper_Frequency : constant Gcode.Frequency_Value := 100.0;
   --  Frequency of the stepper when the machine is idle (Hz)
   Dwell_Stepper_Frequency : constant Gcode.Frequency_Value := 100.0;
   --  Frequency of the stepper when executing a dwell command (Hz)

   Step_Per_Millimeter : Gcode.Float_Position := (27.25, 27.25, 46.11);

   -----------------------
   -- Step pins timming --
   -----------------------

   --    Direction delay   Step duration
   --  |-----------------|---------------|
   --  ^                 ^               ^
   --  Set  direction    Set step        Clear step

   Direction_Pulse_Delay : constant Ada.Real_Time.Time_Span :=
     Ada.Real_Time.Milliseconds (0);
   --  Minimum delay between direction pin change and step pulse

   Step_Pulse_Duration : constant Ada.Real_Time.Time_Span :=
     Ada.Real_Time.Milliseconds (0);
   --  Minimum duration of step pulse

   ------------
   -- Homing --
   ------------

   Home_Coordinate : constant Gcode.Float_Position :=
     (0.0, 0.0, 0.0);
   --  Coordinates of the home position

   Homing_Directions : constant Gcode.Axis_Directions :=
     (Gcode.X_Axis => Gcode.Backward,
      Gcode.Y_Axis => Gcode.Backward,
      Gcode.Z_Axis => Gcode.Forward);
   --  Directions to go to find home switches

   type Homing_Order_Range is range 1 .. 3;
   Homing_Order : constant array (Homing_Order_Range) of Gcode.Axis_Name :=
     (Gcode.Z_Axis, Gcode.X_Axis, Gcode.Y_Axis);

   Homing_Approach_Feed_Rate : constant Gcode.Float_Value := 20.0; --  mm/s
   Homing_Precision_Feed_Rate : constant Gcode.Float_Value := 1.0; --  mm/s

   --  Buffers sizes
   Block_Buffer_Size   : constant := 128;
   Segment_Buffer_Size : constant := 64;
end Settings;