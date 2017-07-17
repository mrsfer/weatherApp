//
//  MainScreenPresenter.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 08.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import Foundation

class MainScreenPresenter: BasePresenter, MainScreenModuleInput, MainScreenViewOutput, MainScreenInteractorOutput {

    weak var viewInput: MainScreenViewInput! {
        get {
            return view as! MainScreenViewInput
        }
    }
    
    var interactorInput: MainScreenInteractorInput! {
        get {
            return interactor as! MainScreenInteractorInput
        }
    }
    
    var routerInput: MainScreenRouterInput! {
        get {
            return router as! MainScreenRouterInput
        }
    }
    
    override func viewIsReady() {
        super.viewIsReady()
    }
    
    // MARK: - MainScreenViewOutput
    
    func showMapScreen() {
        routerInput.setMapScreenController(in: viewInput)
    }
    
    func showListOfWeatherScreen() {
        routerInput.setListOfWeatherScreenController(in: viewInput)
    }
}
