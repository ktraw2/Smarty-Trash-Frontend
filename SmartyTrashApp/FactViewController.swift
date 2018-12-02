//
//  FactViewController.swift
//  SmartyTrashApp
//
//  Created by Priyanka Priyadarshini Mishra on 11/27/18.
//  Copyright © 2018 Priyanka Priyadarshini Mishra. All rights reserved.
//

import UIKit



class FactViewController: UIViewController{
   
    
    @IBOutlet weak var factLabel: UILabel!
    
    let factsArray = ["Every ton of recycled paper saves almost 400 gallons of oil, three cubic yards of landfill and seventeen trees.", "People can get cash back by recycling their old electronics such as cell phones, computers, mp3 or batteries.", "Recycling a single 500 ml aluminium beer can saves enough energy to power a TV for over 4 hours"];
    
    @IBAction func action_Tapped(_ sender: Any) {
        updateLabel()
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        factLabel.text = "Every ton of recycled paper saves almost 400 gallons of oil, three cubic yards of landfill and seventeen trees."
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(self.action_Tapped(_:)))
        factLabel?.isUserInteractionEnabled = true
        factLabel?.addGestureRecognizer(tapAction)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func updateLabel(){
      factLabel.text = factsArray.randomElement()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
