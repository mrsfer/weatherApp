//
//  MapScreenRouter.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 16.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import Foundation
import UIKit

class MapScreenRouter: MapScreenRouterInput {
    
    func showAlertScreenController(in temperatureDifference: Int) {
        
        let presentViewController = findTopViewController()
        if let controller = GlobalRouter.sharedInstance.alertScreenViewController(){
            controller.modalPresentationStyle = .overCurrentContext
            controller.modalTransitionStyle = .coverVertical

            controller.temperatureDifference = temperatureDifference
            presentViewController.present(controller, animated: true, completion: nil)
        }
    }
    
    fileprivate func findTopViewController() -> UIViewController{
        
        var topViewController: UIViewController? = nil
        
        if let visibleViewController = AppDelegate.topViewController() {
            //print("Visible view controller: \(visibleViewController)")
            
            // Menu shoud be presented from UITabBarController to overlap it
            if visibleViewController is UITabBarController {
                // If top visible view controller is tabBar than present from it
                topViewController = visibleViewController
            }
            else if visibleViewController.navigationController?.tabBarController != nil {
                // If top visible view controller has tabBarController than present from it
                topViewController = visibleViewController.navigationController?.tabBarController
            }
            else {
                // If tabBarController can't be found than present from visibleViewControllerß
                topViewController = visibleViewController
            }
            
        }
        
        return topViewController!
    }

}
  
