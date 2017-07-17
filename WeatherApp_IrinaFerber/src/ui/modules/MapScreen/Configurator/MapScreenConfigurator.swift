//
//  MapScreenConfigurator.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 09.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import Foundation
import UIKit

class MapScreenConfigurator {
    
    func configureModuleForViewInput<UIViewController>(_ viewInput: UIViewController) {
        
        if let viewController = viewInput as? MapScreenViewController {
            configure(viewController)
        }
    }
    
    fileprivate func configure(_ viewController: MapScreenViewController) {
    
        let router = MapScreenRouter()
        
        let presenter = MapScreenPresenter()
        presenter.view = viewController
        presenter.router = router
        
        let interactor = MapScreenInteractor()
        interactor.output = presenter
        
        presenter.interactor = interactor
        viewController.output = presenter
    }
}
