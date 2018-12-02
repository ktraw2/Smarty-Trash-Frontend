//
//  StatisticsViewController.swift
//  SmartyTrashApp
//
//  Created by Priyanka Priyadarshini Mishra on 11/27/18.
//  Copyright © 2018 Priyanka Priyadarshini Mishra. All rights reserved.
//

import UIKit
import Charts
import Alamofire
import SwiftyJSON

class StatisticsViewController: UIViewController {
    var hostAddress : String?
    var magData : Double = 0.0
    @IBOutlet weak var lineChartView: LineChartView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
         var magneticData: [Double] = []
        let url  =  "http://" + hostAddress! + "/data/statistics/years=0&months=0&days=1&hours=0&minutes=0"
        Alamofire.request(url).responseJSON {
            response in
            if response.result.isSuccess {
                print("WHY NOT HERE")
                print("Success! Got the MAG data")
                let trashJSON : JSON = JSON(response.result.value!)
               
                var i : Int = 0
                trashJSON["magnetometer"].forEach({ (key, data) in
                    magneticData.append(data["value"].doubleValue)
                    print(magneticData[i])
                    i = i + 1
                })
                self.setChartValues(count: magneticData.count, array: magneticData)
                
                //self.magData = trashJSON["magnetometer"]["132"]["value"].doubleValue
                //print("MAG DATA")
                //print(self.magData)
                
                //print(trashJSON)
                
                
                //self.updateTrashData(json: trashJSON)
                
            }
            else {
                print("WAS HERE")
                print("Error \(String(describing: response.result.error))")
                //self.errorLabel.text = "Connection Issues"
                
                
            }
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func setChartValues(count : Int, array: [Double]){
        let values = (0..<count).map{ (i) -> ChartDataEntry in
            let val = array[i]
            return ChartDataEntry(x: Double(i), y: val)
        }
        
        let set1 = LineChartDataSet(values: values, label: "Amount of Metal in Trash")
        let data = LineChartData(dataSet: set1)
        self.lineChartView.data = data
        
    }
    
}

