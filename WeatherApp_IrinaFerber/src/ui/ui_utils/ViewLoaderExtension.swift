//
//  ViewLoaderExtension.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 08.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import Foundation

extension BaseViewInput where Self: BaseViewController {
    
    func startLoading() {
        progressIndicatorView.removeFromSuperview()
        progressIndicatorView = CircularLoaderView(frame: .zero)
        progressIndicatorView.alpha = 0
        view.addSubview(progressIndicatorView)
        progressIndicatorView.frame = view.bounds
        progressIndicatorView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        progressIndicatorView.start()
        
        animate({ [weak self] in
            self?.progressIndicatorView.alpha = 1.0
        })
    }
    
    func stopLoading() {
        animate({ [weak self] in
            self?.progressIndicatorView.alpha = 0.0
            }, completion: { [weak self] (result: Bool) in
                self?.progressIndicatorView.stop()
                self?.progressIndicatorView.removeFromSuperview()
        })
    }
}
