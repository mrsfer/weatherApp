//
//  MainScreenRouter.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 08.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import Foundation

protocol MainScreenRouterInput: BaseRouterInput {
    
    func setMapScreenController(in viewInput: MainScreenViewInput)
    func setListOfWeatherScreenController(in viewInput: MainScreenViewInput)
}
