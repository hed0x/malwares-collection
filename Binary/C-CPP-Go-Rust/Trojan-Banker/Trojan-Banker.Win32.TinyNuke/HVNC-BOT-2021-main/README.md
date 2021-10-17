# HVNC-2021   C++

Features:
- Hidden Desktop (resize in accurate proportions for the best results)
- Control Multiple Machines at Once
- Open "Run"
- Start Powershell
- Start Chrome
- Start Edge
- Start Brave
- Start Firefox
- Start Internet Explorer

Usage:
- In the Client's "Main.cpp" file, edit the ip and port variables.
- In the Server's "Server.cpp" file, find "BOOL StartServer(int port)", and replace the port within "addr.sin_port = htons(6666);" with the port you want the Server to listen on.
- Compile the Server & Client, and run the Server. Now, when the Client is executed, it will open a new "Hidden Desktop" window. If you right-click on the white bar at the top of the "Hidden Desktop" window, you can view the available commands that you can run on the target machine. 


<img src="https://i.ibb.co/bLttRg3/Unbenannt.png" ><br>

<img src="https://i.ibb.co/3CFmJ90/Unbennt.png" ><br>

<img src="https://i.ibb.co/ydcMBHb/Unbenannt.png" ><br>
