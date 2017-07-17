//
//  GlobalRouter.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 08.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import Foundation
import UIKit

class GlobalRouter {
    
    static let sharedInstance = GlobalRouter()
    
    func mapScreenViewController() -> UIViewController? {
        
        let storyboard = UIStoryboard(name: "Map", bundle: nil)
        return storyboard.instantiateInitialViewController()!
    }
    
    func listOfWeatherViewController() -> UIViewController? {
        
        let storyboard = UIStoryboard(name: "ListOfWeather", bundle: nil)
        return storyboard.instantiateInitialViewController()!
    }
    
    func alertScreenViewController() -> AlertScreenViewController? {
        let storyboard = UIStoryboard(name: "AlertScreen", bundle: nil)
        return storyboard.instantiateInitialViewController() as? AlertScreenViewController
    }
}
