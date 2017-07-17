//
//  BasePresenter.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 08.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import Foundation

class BasePresenter: NSObject,
BaseModuleInput, BaseViewOutput, BaseInteractorOutput {
    
    weak var view: BaseViewInput!
    var interactor: BaseInteractorInput!
    var router: BaseRouterInput!
    
    func viewIsReady() {
        
    }
}
