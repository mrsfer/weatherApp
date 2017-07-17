//
//  MainScreenInitializer.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 08.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import UIKit

class MainScreenModuleInitializer: NSObject {
    
    //Connect with object on storyboard
    @IBOutlet weak var mainscreenViewController: MainScreenViewController!
    
    override func awakeFromNib() {
        
        let configurator = MainScreenModuleConfigurator()
        configurator.configureModuleForViewInput(mainscreenViewController)
    }
}
