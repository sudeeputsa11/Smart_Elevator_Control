module lift_controller(CF, L1, L2, clock, reset, seg_display, red_led, yellow_led, LED_COM);
    input [3:0] CF;       // Call floor
    input [3:0] L1;       // Lift 1 position
    input [3:0] L2;       // Lift 2 position
    input clock;          // Clock signal
    input reset;          // Reset signal
    output reg [6:0] seg_display; // 7-segment display
    output reg red_led;   // Red LED for "up"
    output reg yellow_led; // Yellow LED for "down"
    inout LED_COM = 1;


    // Intermediate variables
    reg [3:0] d1, d2;     // Distances between CF and L1, L2
    reg Lift_Selected;    // Selected Lift
    reg Lift_up;          // Direction (1 for up, 0 for down)
    
    // 7-segment encoding for numbers
    parameter SEG_1 = 7'b0110000; // Encoding for "1"
    parameter SEG_2 = 7'b1101101; // Encoding for "2"
    parameter SEG_BLANK = 7'b0000000; // Blank display

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            // Reset all outputs
            Lift_Selected <= 0;
            Lift_up <= 0;
            seg_display <= SEG_BLANK; // Blank display
            red_led <= 0;
            yellow_led <= 0;
        end else begin
            // Calculate distances
            d1 = (CF > L1) ? (CF - L1) : (L1 - CF);
            d2 = (CF > L2) ? (CF - L2) : (L2 - CF);

            // Lift selection and direction logic
            if (L1 == CF) begin
                // Lift 1 is on the same floor as CF
                Lift_Selected <= 1;
                seg_display <= SEG_1; // Display "1"
                red_led <= 0;         // No movement
                yellow_led <= 0;      // No movement
            end else if (L2 == CF) begin
                // Lift 2 is on the same floor as CF
                Lift_Selected <= 0;
                seg_display <= SEG_2; // Display "2"
                red_led <= 0;         // No movement
                yellow_led <= 0;      // No movement
            end else if (d1 <= d2) begin
                // Prefer Lift 1
                Lift_Selected <= 1;
                Lift_up <= (CF > L1) ? 1 : 0; // Direction for Lift 1
                seg_display <= SEG_1;        // Display "1"
                red_led <= (Lift_up) ? 1 : 0; // Red LED for "up"
                yellow_led <= (Lift_up) ? 0 : 1; // Yellow LED for "down"
            end else begin
                // Prefer Lift 2
                Lift_Selected <= 0;
                Lift_up <= (CF > L2) ? 1 : 0; // Direction for Lift 2
                seg_display <= SEG_2;        // Display "2"
                red_led <= (Lift_up) ? 1 : 0; // Red LED for "up"
                yellow_led <= (Lift_up) ? 0 : 1; // Yellow LED for "down"
            end
        end
    end
endmodule
