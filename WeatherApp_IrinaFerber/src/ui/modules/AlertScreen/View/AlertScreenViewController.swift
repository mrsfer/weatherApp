//
//  AlertScreen.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 15.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import Foundation
import UIKit

class AlertScreenViewController: BaseViewController {
    
    var temperatureDifference: Int!
    
    @IBOutlet weak var temperatureDifferenceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(closeAlert), name: .UIApplicationWillResignActive, object: nil)
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
        
        temperatureDifferenceLabel.text = "Температура уменьшилась на " + String(temperatureDifference!) + " градуса."
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func closeAlert(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func okButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
