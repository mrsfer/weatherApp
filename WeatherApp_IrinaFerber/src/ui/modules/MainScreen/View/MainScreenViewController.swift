//
//  MainScreenViewController.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 08.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import UIKit

class MainScreenViewController: BaseViewController, MainScreenViewInput, UITabBarDelegate {
    
    var viewOutput: MainScreenViewOutput! {
        get {
            return output as! MainScreenViewOutput
        }
    }
    var currentItemSelected: UITabBarItem?
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var mapItem: UITabBarItem!
    @IBOutlet weak var listOfWeatherItem: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeTabBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if currentItemSelected == nil {
            viewOutput.showMapScreen()
            tabBar.selectedItem = mapItem
            currentItemSelected = mapItem
        }
    }
    
    func customizeTabBar() {
        
        tabBar.delegate = self
        tabBar.selectionIndicatorImage = UIColor.makeImageWithColorAndSize(UIColor.white, size: CGSize(width: tabBar.frame.width/4, height: tabBar.frame.height))
    }
    
    // MARK: - UITabBarDelegate
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item {
        case mapItem:
            currentItemSelected = mapItem
            viewOutput.showMapScreen()
        case listOfWeatherItem:
            currentItemSelected = listOfWeatherItem
            viewOutput.showListOfWeatherScreen()
        default:
            currentItemSelected = mapItem
            viewOutput.showMapScreen()
        }
    }
}
