//
//  AlertExtension.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 08.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import Foundation
import UIKit

extension BaseViewInput where Self: BaseViewController {
    
    func showErrors(_ errors: [RequestError]) {
        showErrors(errors) {}
    }
    
    func showErrors(_ errors: [RequestError], callback: (() -> Void)?) {
        
        let alertController = UIAlertController(title: "Error", message: errors.map { $0.errorText }.joined(separator: "\n") , preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
            if let callback = callback {
                callback()
            }
        }
        
        alertController.addAction(OKAction)
        
        present(alertController, animated: true) {}
    }
    
    func showMessage(_ title: String) {
        
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        present(alertController, animated: true) {}
    }
    
    func showMessage(_ title: String, callback: @escaping (() -> Void)) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: ls("alert_extensions.cancel"), style: .cancel, handler: nil)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            callback()
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(OKAction)
        
        present(alertController, animated: true) {}
    }
    
    func showMessage(_ title: String, text: String, callback: @escaping (() -> Void)) {
        let alertController = UIAlertController(title: title, message: text, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: ls("alert_extensions.cancel"), style: .cancel, handler: nil)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            callback()
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(OKAction)
        
        present(alertController, animated: true) {}
    }
}
