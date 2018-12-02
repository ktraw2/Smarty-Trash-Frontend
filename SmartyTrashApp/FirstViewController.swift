//
//  FirstViewController.swift
//  SmartyTrashApp
//
//  Created by Priyanka Priyadarshini Mishra on 11/23/18.
//  Copyright © 2018 Priyanka Priyadarshini Mishra. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class FirstViewController: UIViewController{
    var hostAddress: String?
    
    var trashFullOrNot : Bool?
    var magneticResults: Double = 0.0
    var trashCount : Int = 0
    let MAX_TRASH = 2300
    var currentData : Float = 0;
    
   
    @IBOutlet weak var numTimesTrashFull: UILabel!
    @IBOutlet weak var magnetometerData: UILabel!
    
    @IBOutlet weak var trashLevel: UIProgressView!
    @IBOutlet weak var hostAdd: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        /*if(self.trashFullOrNot!){
            self.trashLevel.progress = 1.0
        }else{
            self.trashLevel.progress = 0.5
        }*/
        let hostAdd  = "http://" + hostAddress! + "/data/statistics/years=0&months=0&days=1&hours=0&minutes=0"
        let liveHost = "http://" + hostAddress! + "/data/live"
        // Do any additional setup after loading the view, typically from a nib.
        makeRequest(url: hostAdd, liveUrl: liveHost)
    }
    
    
    func makeRequest(url : String, liveUrl: String){
     
        Alamofire.request(liveUrl).responseJSON {
            response in
            if response.result.isSuccess {

                
                let trashJSON : JSON = JSON(response.result.value!)
                
                self.trashFullOrNot = trashJSON["proximity"]["value"].intValue > trashJSON["proximity"]["threshold"].intValue
                if (self.trashFullOrNot!){
                    self.trashLevel.progress = 1.0
                    print("TRASH FULL FIRST")
                    print(self.trashFullOrNot!)
                }else{
                    self.trashLevel.progress = 0.5
                }
                
            }
            else {
                print("WAS HERE")
                print("Error \(String(describing: response.result.error))")
                //self.errorLabel.text = "Connection Issues"
                
                
            }
        }
        Alamofire.request(url).responseJSON {
            response in
            if response.result.isSuccess {
                print("WHY NOT HERE")
                print("Success! Got the TRASH data")
                //let trashJSON : JSON = JSON(response.result.value!)
                
                
                 let trashJSON : JSON = JSON(response.result.value!)
               
                self.trashCount = trashJSON["num_breakbeam"].intValue
                print("TRASH FULL!!!")
                print(self.trashFullOrNot!)
                self.magnetometerData.text = String(trashJSON["num_breakbeam"].intValue)
                
                self.numTimesTrashFull.text = String(trashJSON["proximity"].count)
                
               
                /*self.currentData = Float(self.trashFullOrNot)
                if(self.trashFullOrNot == 2300){
                  self.trashLevel.setProgress(self.currentData, animated: true)
                    self.trashLevel.progress = Float(self.trashFullOrNot/self.MAX_TRASH)
                } else {
                  self.trashLevel.progress = Float((self.MAX_TRASH/2)/self.MAX_TRASH)
                }*/
                
                 self.makeRequest(url: url, liveUrl: liveUrl)
                
                /*self.magneticResults = trashJSON["magnetometer"]["value"].doubleValue
                self.trashFull  = trashJSON["proximity"]["value"].doubleValue
                self.magnetometerData.text = String(self.magneticResults)*/
                //self.updateTrashData(json: trashJSON)
                
            }
            else {
                print("WAS HERE")
                print("Error \(String(describing: response.result.error))")
                //self.errorLabel.text = "Connection Issues"
                
                
            }
       }
        }
        /*func updateTrashData(json: JSON){
            magneticResults = json["magnetometer"]["value"].doubleValue
            trashFull  = json["proximity"]["value"].doubleValue
            
            print(trashFull)
            print(magneticResults)
            //updateUI(mag: magneticResults, prox: trashFull)
        }*/
    
    
    func userEnteredANewHost(host: String){
        magnetometerData.text = host
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

