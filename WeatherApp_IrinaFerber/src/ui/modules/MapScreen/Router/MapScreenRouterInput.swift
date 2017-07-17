//
//  MapScreenRouterInput.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 16.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import Foundation

protocol MapScreenRouterInput: BaseRouterInput {
    
    func showAlertScreenController(in temperatureDifference: Int)
}
