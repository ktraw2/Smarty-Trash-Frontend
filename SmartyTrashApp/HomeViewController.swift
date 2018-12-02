//
//  HomeViewController.swift
//  SmartyTrashApp
//
//  Created by Priyanka Priyadarshini Mishra on 11/27/18.
//  Copyright © 2018 Priyanka Priyadarshini Mishra. All rights reserved.
//


import UIKit
import UserNotifications

class HomeViewController: UIViewController {
    
    var hostAddress: String?
    


    let factsArray = ["Every ton of recycled paper saves almost 400 gallons of oil, three cubic yards of landfill and seventeen trees.", "People can get cash back by recycling their old electronics such as cell phones, computers, mp3 or batteries.", "Recycling a single 500 ml aluminium beer can saves enough energy to power a TV for over 4 hours"];
    override func viewDidLoad() {
        super.viewDidLoad()
        //data.text = hostAddress
        
        let content = UNMutableNotificationContent()
        content.title = "Fact of the Day"
        content.body = factsArray.randomElement()!
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        //content.body = factsArray.randomElement()!
        let request = UNNotificationRequest(identifier: "testIdentifier", content: updateContent(), trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        // Do any additional setup after loading the view, typically from a nib.
        // Do any additional setup after loading the view, typically from a nib.
    }
    
   func updateContent() ->UNMutableNotificationContent{
        let content = UNMutableNotificationContent()
        content.title = "Fact of the Day"
        content.body = factsArray.randomElement()!
        content.sound = UNNotificationSound.default()
        return content
    }
    
    
    @IBAction func disconnect(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
