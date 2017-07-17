//
//  WeatherStruct.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 10.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import Foundation
import CoreData

struct Weather {
    
    var temperature: String?
    var weatherType: String?
    var date: String?
    var time: String?
    
    init(){
        
    }
    
    init(_ temperature: String, _ weatherType: String, _ date: String, _ time: String) {
        self.temperature = temperature
        self.weatherType = weatherType
        self.date = date
        self.time = time
    }
}
