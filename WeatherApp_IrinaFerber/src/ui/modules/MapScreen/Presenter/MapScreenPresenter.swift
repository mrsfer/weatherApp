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
            
            callback(valueWeather?.temperature)
            
            let lastWeather = CoreDataService.obtainLastWeather()
            
            if  (lastWeather - Int((valueWeather?.temperature)!)!) >= 3 && (lastWeather != -999) {
                DispatchQueue.main.async {
                    let temperatureDifference = lastWeather - Int((valueWeather?.temperature)!)!
                    self?.showAlertScreen(temperatureDifference)
                }
            }
            
            CoreDataService.saveToLocalBase((valueWeather?.temperature!)!, (valueWeather?.weatherType!)!)
        }
    }
    
    fileprivate func showAlertScreen(_ temperatureDifference: Int) {
        routerInput.showAlertScreenController(in: temperatureDifference)
    }
    
}
