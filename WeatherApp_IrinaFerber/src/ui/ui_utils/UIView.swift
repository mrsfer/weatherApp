//
//  UIView.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 08.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func removeSubviews() {
        for view: UIView in self.subviews {
            view.removeFromSuperview()
        }
    }
}
