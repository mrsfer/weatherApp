//
//  MapScreenInteractor.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 09.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class MapScreenInteractor: BaseInteractor, MapScreenInteractorInput {
    
    var weatherEntity: [NSManagedObject] = []
    
    func obtainWeather(with latitude: String, longitude: String, _ callback: @escaping (String?, [RequestError]?) -> Void) {
        
        WeatherRequest(latitude: latitude, longitude: longitude).request { (json, errors) in
            if let errors = errors {
                callback(nil, errors)
                return
            }
            
            var weather = Weather()
            
            if let json = json {
                if let mainItems = json["main"].dictionary {
                    if let temp = mainItems["temp"]?.double {
                        let tempDegreesCelsius = Int(temp - 273.15)
                        let tempStr = String(tempDegreesCelsius)
                        weather.temperature = tempStr
                    }
                }
                
                if let weatherItems = json["weather"].array {
                    if let main = weatherItems[0]["main"].string {
                        weather.weatherType = main
                    }
                }
                
                CoreDataService.saveToLocalBase(weather.temperature!, weather.weatherType!)
                
                callback(weather.temperature, nil)
            }
        }
    }
}
