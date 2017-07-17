//
//  MapScreenViewOtput.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 09.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import Foundation

protocol MapScreenViewOutput: BaseViewOutput {
    
    func onObtainWeather(latitude: String, longitude: String, _ callback: @escaping (String?) -> Void)
}
