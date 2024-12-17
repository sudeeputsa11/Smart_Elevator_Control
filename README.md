# Smart Elevator Control
A two-elevator single call button control system implemented using Verilog and CPLD.

📜 Project Overview
The Smart Elevator Control System is designed to manage two elevators efficiently using a single call button. The system determines which elevator should respond to a call based on real-time factors such as:
•	The current position of the elevators.
•	The proximity of the call floor to each elevator.
•	Movement direction (up or down).
The project optimizes response times, reduces energy consumption, and provides real-time feedback through 7-segment displays and LED indicators. This makes the system efficient, user-friendly, and ideal for small to medium-scale applications like residential buildings, hospitals, and offices.

🚀 Key Features
1.	Two-Elevator Control: Handles two elevators with a single call button.
2.	Proximity-Based Decision: The system selects the closest elevator to the call floor.
3.	Direction Feedback: Visual indication of elevator movement (UP/DOWN) via LEDs.
4.	7-Segment Display: Displays the elevator responding to the call.
5.	Real-Time Operation: Implemented on a CPLD 2900 board for fast and accurate response.

🛠️ Tools Used
1. Hardware Description Language: Verilog
2. Simulation Tools: Quartus II 8.1 Web Edition for code synthesis and implementation.
3. Hardware: CPLD 2900 Board

![Quartus II 8 1 Web Edition](https://github.com/user-attachments/assets/45b078f5-8f02-4e8f-b4e6-55c442ea48ec)

⚙️ Algorithm

![Smart Elevator](https://github.com/user-attachments/assets/bdd0fe5d-9815-40cf-bf0d-b27bfa3e0afe)

🗺️ Pin Planner

![Pin Planner](https://github.com/user-attachments/assets/3ee99148-c06c-41b3-941b-3324ac6d5190)

🧪 Test Cases:
Test Cases for Smart Elevator Control System
Test Case 1: Initial State
–	Lift 1 Position: 0
–	Lift 2 Position: 0
–	Call Floor: 0
–	Responded Lift: 1
–	Direction: None
–	LED Status: None
![image](https://github.com/user-attachments/assets/9b0ffac9-87a4-4af5-8d49-944fd21ae192)

Test Case 2: Both Lifts at Same Position
–	Lift 1 Position: 15
–	Lift 2 Position: 15
–	Call Floor: 0
–	Responded Lift: 1
–	Direction: Down
–	LED Status: Yellow
![image](https://github.com/user-attachments/assets/b6eda384-3d29-44ea-81f1-b21eede27065)

Test Case 3: Lift Called to an Upper Floor
–	Lift 1 Position: 0
–	Lift 2 Position: 0
–	Call Floor: 2
–	Responded Lift: 1
–	Direction: Up
–	LED Status: Red
![image](https://github.com/user-attachments/assets/43f54af1-0472-4f66-808a-107d26b7e16d)

Test Case 4: Lift Already at the Call Floor
–	Lift 1 Position: 2
–	Lift 2 Position: 2
–	Call Floor: 2
–	Responded Lift: 1
–	Direction: None
–	LED Status: None

Test Case 5: Lift Called to a Higher Floor (Different from Both Lifts)
–	Lift 1 Position: 2
–	Lift 2 Position: 2
–	Call Floor: 3
–	Responded Lift: 1
–	Direction: Up
–	LED Status: Red
Test Case 6: Lift Called to a Lower Floor
–	Lift 1 Position: 2
–	Lift 2 Position: 2
–	Call Floor: 1
–	Responded Lift: 1
–	Direction: Down
–	LED Status: Yellow
Test Case 7: Lift 1 Matches Call Floor, Lift 2 Further Away
–	Lift 1 Position: 5
–	Lift 2 Position: 7
–	Call Floor: 5
–	Responded Lift: 1
–	Direction: None
–	LED Status: None
Test Case 8: Call Floor Matches Lift 2’s Position
–	Lift 1 Position: 2
–	Lift 2 Position: 8
–	Call Floor: 8
–	Responded Lift: 2
–	Direction: None
–	LED Status: None
Test Case 9: Lift 1 Closer to Call Floor
–	Lift 1 Position: 2
–	Lift 2 Position: 10
–	Call Floor: 6
–	Responded Lift: 1
–	Direction: Up
–	LED Status: Red
Test Case 10: Lift 2 Closer to Call Floor
–	Lift 1 Position: 7
–	Lift 2 Position: 8
–	Call Floor: 15
–	Responded Lift: 2
–	Direction: Up
–	LED Status: Red
Test Case 11: Lift Called to a Lower Floor, Preference for Lift 1
–	Lift 1 Position: 7
–	Lift 2 Position: 8
–	Call Floor: 2
–	Responded Lift: 1
–	Direction: Down
–	LED Status: Yellow
Test Case 12: Lift 2 Selected for Downward Call
–	Lift 1 Position: 2
–	Lift 2 Position: 9
–	Call Floor: 7
–	Responded Lift: 2
–	Direction: Down
–	LED Status: Yellow
Test Case 13: Lift 1 Handles an Upper Call
–	Lift 1 Position: 10
–	Lift 2 Position: 8
–	Call Floor: 12
–	Responded Lift: 1
–	Direction: Up
–	LED Status: Red
Notes:
1.	Each test checks a unique scenario (e.g., lifts equidistant, call to an upper/lower floor, or direction control).
2.	The LED Status corresponds to the movement direction:
–	Red → UP
–	Yellow → DOWN
–	None → No movement.

