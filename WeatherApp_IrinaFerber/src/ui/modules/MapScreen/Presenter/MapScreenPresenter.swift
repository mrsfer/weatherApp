//
//  MapScreenPresenter.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 09.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import Foundation

class MapScreenPresenter: BasePresenter, MapScreenModuleInput, MapScreenViewOutput {

    weak var viewInput: MapScreenViewInput! {
        get {
            return view as! MapScreenViewInput
        }
    }
    var interactorInput: MapScreenInteractorInput! {
        get {
            return interactor as! MapScreenInteractorInput
        }
    }
    
    var routerInput: MapScreenRouterInput! {
        get {
            return router as! MapScreenRouterInput
        }
    }
  
    func onObtainWeather(latitude: String, longitude: String, _ callback: @escaping (String?) -> Void) {
        
        interactorInput.obtainWeather(with: latitude, longitude: longitude) { [weak self] (valueWeather, errors) in
            guard let strongSelf = self else { return }
            
            strongSelf.viewInput.stopLoading()
            
            if let errors = errors {
                strongSelf.viewInput.showErrors(errors)
                callback(nil)
                return
            }
            
            callback(valueWeather)
            
            let lastWeather = CoreDataService.obtainLastWeather()
            print(Swift.abs(lastWeather))
            if  Swift.abs(Swift.abs(Int(valueWeather!)!) - Swift.abs(lastWeather)) >= 3 && (lastWeather != -1000) {
                DispatchQueue.main.async {
                    let temperatureDifference = Swift.abs(Swift.abs(Int(valueWeather!)!) - Swift.abs(lastWeather))
                    self?.showAlertScreen(temperatureDifference)
                }
            }
        }
    }
    
    fileprivate func showAlertScreen(_ temperatureDifference: Int) {
        routerInput.showAlertScreenController(in: temperatureDifference)
    }
    
}
