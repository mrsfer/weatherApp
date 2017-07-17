//
//  MainScreenRouterInput.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 08.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class MainScreenRouter: MainScreenRouterInput {
    
    var mapScreenController: UIViewController?
    var listOfWeatherScreenController: UIViewController?
    
    func setMapScreenController(in viewInput: MainScreenViewInput) {
        
        guard let viewInputController = viewInput as? BaseViewController else { return }
        
        if mapScreenController == nil {
            if let controller = GlobalRouter.sharedInstance.mapScreenViewController(){
                mapScreenController = controller
                viewInputController.addChildViewController(mapScreenController!)
            }
        }
        
        addSubview(to: viewInput, controller: mapScreenController)
    }
    
    func setListOfWeatherScreenController(in viewInput: MainScreenViewInput) {
        
        guard let viewInputController = viewInput as? BaseViewController else { return }
        
        if listOfWeatherScreenController == nil {
            if let controller = GlobalRouter.sharedInstance.listOfWeatherViewController() {
                listOfWeatherScreenController = controller
                viewInputController.addChildViewController(listOfWeatherScreenController!)
            }
        }
        
        addSubview(to: viewInput, controller: listOfWeatherScreenController)
    }
    
    fileprivate func addSubview(to viewInput: MainScreenViewInput, controller: UIViewController?) {
        viewInput.containerView.removeSubviews()
        
        if let controller = controller {
            viewInput.containerView.addSubview(controller.view)
            controller.view.snp.remakeConstraints { make in
                make.edges.equalTo(viewInput.containerView)
            }
            viewInput.containerView.layoutIfNeeded()
        }
    }
}
