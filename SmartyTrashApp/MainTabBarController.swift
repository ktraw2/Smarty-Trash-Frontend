//
//  MainTabBarController.swift
//  SmartyTrashApp
//
//  Created by Priyanka Priyadarshini Mishra on 11/30/18.
//  Copyright © 2018 Priyanka Priyadarshini Mishra. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class MainTabBarController : UITabBarController {
    
    var hostAdd: String?
    var magnetResult : Double = 0.0
    var trashFul : Bool = false
    var proximitySensorData : Int = 0;
    var threshold : Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewControllers = viewControllers else {
            return
        }
       // let url = "http://" + hostAdd! + "/data/live"
        /*Alamofire.request(url).responseJSON {
            response in
            if response.result.isSuccess {
                print("WHY NOT HERE")
                print("Success! Got the TRASH data")
                //let trashJSON : JSON = JSON(response.result.value!)
                
                
                let trashJSON : JSON = JSON(response.result.value!)
                
                self.proximitySensorData = trashJSON["proximity"]["value"].intValue
                self.threshold = trashJSON["proximity"]["threshold"].intValue
                if (self.proximitySensorData > self.threshold){
                    self.trashFul = true
                    print("TRASH FULL MAIN TAB")
                    print(self.trashFul)
                }
                    
                
                print("PROXIMITY")
                print(self.proximitySensorData)
                
            }
            else {
                print("WAS HERE")
                print("Error \(String(describing: response.result.error))")
                //self.errorLabel.text = "Connection Issues"
                
                
            }
        }*/
        for viewController in viewControllers{
            if let statusNavigationController = viewController as? StatusNavigationController {
                if let statusViewController = statusNavigationController.viewControllers.first as? FirstViewController{
                    statusViewController.hostAddress = hostAdd
                    //print("PASSING TRASH")
                    //print(self.proximitySensorData > self.threshold)
                    //statusViewController.trashFullOrNot = self.proximitySensorData > self.threshold
                    //statusViewController.magneticResults = magnetResult
                    //statusViewController.trashFull = trashFul
                }
            }
            if let statisticsNavigationController = viewController as? StatisticsNavigationController {
                if let statisticsViewController = statisticsNavigationController.viewControllers.first as? StatisticsViewController{
                    statisticsViewController.hostAddress = hostAdd
                    
                    //statusViewController.magneticResults = magnetResult
                    //statusViewController.trashFull = trashFul
                }
            }
        }
    }
    
}
   
    
   

