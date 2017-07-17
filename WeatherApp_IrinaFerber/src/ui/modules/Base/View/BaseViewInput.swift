//
//  BaseViewInput.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 08.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import UIKit

protocol BaseViewInput: class {
    
    var progressIndicatorView: CircularLoaderView { get }
    func startLoading()
    func stopLoading()
    
    func showErrors(_ errors: [RequestError])
    func showErrors(_ errors: [RequestError], callback: (() -> Void)?)
    func showMessage(_ title: String)
    func showMessage(_ title: String, callback: @escaping (() -> Void))
    func showMessage(_ title: String, text: String, callback: @escaping (() -> Void))
}
