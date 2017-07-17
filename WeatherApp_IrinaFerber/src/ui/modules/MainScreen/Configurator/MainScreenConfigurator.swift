//
//  MainScreenConfigurator.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 08.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import UIKit

class MainScreenModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(_ viewInput: UIViewController) {
        
        if let viewController = viewInput as? MainScreenViewController {
            configure(viewController)
        }
    }
    
    fileprivate func configure(_ viewController: MainScreenViewController) {
        
        let router = MainScreenRouter()
        
        let presenter = MainScreenPresenter()
        presenter.view = viewController
        presenter.router = router
        
        let interactor = MainScreenInteractor()
        interactor.output = presenter
        
        presenter.interactor = interactor
        viewController.output = presenter
    }
    
}

