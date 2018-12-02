//
//  ConnectViewController.swift
//  SmartyTrashApp
//
//  Created by Priyanka Priyadarshini Mishra on 11/28/18.
//  Copyright © 2018 Priyanka Priyadarshini Mishra. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
protocol ChangeAddressDelegate {
    func userEnteredANewHost(host: String)
}

class ConnectViewController: UIViewController {

    
    @IBOutlet weak var inputHostAddress: UITextField!
    //var delegate : ChangeAddressDelegate?
   
    var magneticResults : Double = 0.0
    var trashFull : Double = 0.0
    var numTrash :  Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func connectButtonTapped(_ sender: Any) {
        //print("Was Here")
        //let address = "http://" + inputHostAddress.text! + "/data/live"
        //checkConnection(url: address);
       // let address = "http://" + inputHostAddress.text! + "/data/live"
        //checkConnection(url: address)
        
        
        /*let myTabBar = self.storyboard?.instantiateViewController(withIdentifier: "myTabBar")as! UITabBarController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = myTabBar*/
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let address = "http://" + inputHostAddress.text! + "/data/live"
        //let address = "http://" + inputHostAddress.text! + "/data/live"
        //checkConnection(url: address);
        //if(checkConnection(url: address) == false){
       
        /*Alamofire.request(address).responseJSON {
            response in
            if response.result.isSuccess {
                print("WHY NOT HERE")
                print("Success! Got the TRASH data")
                let trashJSON : JSON = JSON(response.result.value!)
                //self.updateTrashData(json: trashJSON)
                self.magneticResults = trashJSON["magnetometer"]["value"].doubleValue
                self.trashFull  = trashJSON["proximity"]["value"].doubleValue
                print(trashJSON)
                
                
                
                
            }
            else {
                print("WAS HERE")
                print("Error \(String(describing: response.result.error))")
                self.errorLabel.text = "Connection Issues"
                
            }
          }
          //self.updateTrashData(json: trashJSON)
        
            
          print(self.trashFull)
          print(self.magneticResults)*/
          if let mainTabBarController = segue.destination as? MainTabBarController{
            mainTabBarController.hostAdd = inputHostAddress.text!
            print("PASSING DATA: ")
            print(self.magneticResults)
              mainTabBarController.magnetResult = self.magneticResults
              //mainTabBarController.trashFul = self.trashFull
          }
        //}
    }
    
    /*func checkConnection(url: String){
        Alamofire.request(url).responseJSON {
            response in
            if response.result.isSuccess {
                print("WHY NOT HERE")
                print("Success! Got the TRASH data")
                let trashJSON : JSON = JSON(response.result.value!)
                
                
                print(trashJSON)
               
                
                //self.updateTrashData(json: trashJSON)
                
            }
            else {
                print("WAS HERE")
                print("Error \(String(describing: response.result.error))")
                self.errorLabel.text = "Connection Issues"
              
               
            }
        }
        /*if((self.errorLabel.text?.isEqual("Connection Issues" ))!){
          return false
        }
        return true;*/
    }*/
    
    func updateTrashData(json: JSON){
        magneticResults = json["magnetometer"]["value"].doubleValue
        trashFull  = json["proximity"]["value"].doubleValue
        
        print(trashFull)
        print(magneticResults)
        //updateUI(mag: magneticResults, prox: trashFull)
    }
    
    func updateUI(mag: Double, prox: Double){
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

