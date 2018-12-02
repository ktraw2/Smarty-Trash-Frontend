# Smarty-Trash-Frontend
## A smart trash can connected to a mobile app that displays disposal statistics and trash levels, in order to encourage citizens to be more conscious of their actions and to promote sustainable living. This is the fronend code.

## App Walk Through
<a href="https://imgflip.com/gif/2o00ah"><img src="https://i.imgflip.com/2o00ah.gif" title="made at imgflip.com"/></a>
## Guide to building the app

1. Open a new project on Xcode
2. Create an app icon in Canva or Pixlr and upload the icon to https://appicon.co/ and download it to your computer
3. Then open the app icon using the assets folder in Xcode
4. Create a login screen view controller, from which we will be requesting data from sensor data stored in the database 
5. Add a launch screen with a “Smarty Trash” logo and text 
6. We will be creating 4 more view controllers, connected by a tab view controller bar: a home screen view controller, a facts view controller, a statistics view controller, and a status view controller
7. On the home screen view controller, we will be adding a UIViewcontroller  that displays an introduction to our smart trash can 8. in a dialogue box 
9. On the facts view controller, we will be adding a dialogue box with a tap gesture recognition to generate a series of 
10. sustainable facts that consumers can tap through
11. In the statistics view controller, we will be using Charts from CocoaPods to display our trash statistics from the magnetometer in a line chart format (follow the Installation of Line Charts guide to complete this)
12. In our status view controller, we will be showing the current level of trash in the trash can along with the trash count (how many times the IR break beam sensor has been broken). We also include data about number of times trash can has been full.


