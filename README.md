#  DEMO500px
This project is written in Swift 5 using Xcode 11.3.1.
Deployment target is iOS 10. 

## Dependencies
This project uses *Swift Package Manager* as a dependency manager. 

Dependencies used in this  project are: 
-  Alamofire 5.0.4 
-  SDWebImage 5.6.1

## Architecture
This project uses Clean Swift Architecture in the PopularPhotos scene.

DataServer Folder contains networking related files and folders. 
Alamofire codes are contained in APIContoller, Connectivity and Endpoint  classes. 
SDWebImage is only imported in PhotoLoader file to facilitate its removal if needed.

## Tests
Decoding and Viewmodel  tests.

## NOTES
The project has icon warnings which are intentionally not fixed. 
*SF Symbol 'star.circle.fill' is unavailable prior to iOS 13.0.* 
 
