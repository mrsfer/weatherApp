//
//  MapScreenInitializer.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 09.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import Foundation
import UIKit

class MapScreenInitializer: NSObject {
    
    //Connect with object on storyboard
    @IBOutlet weak var mapScreenViewController: MapScreenViewController!
    
    override func awakeFromNib() {
        
        let configurator = MapScreenConfigurator()
        configurator.configureModuleForViewInput(mapScreenViewController)
    }
}
