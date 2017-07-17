//
//  MainScreenInteractor.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 08.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import Foundation

class MainScreenInteractor: BaseInteractor, MainScreenInteractorInput {
    
    weak var interactorOutput: MainScreenInteractorOutput! {
        get {
            return output as! MainScreenInteractorOutput
        }
    }
}
