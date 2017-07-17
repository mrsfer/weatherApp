//
//  BaseViewController.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 08.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import UIKit
import Foundation

class BaseViewController: UIViewController, BaseViewInput {
    
    var progressIndicatorView: CircularLoaderView = CircularLoaderView(frame: CGRect.zero)
    var output: BaseViewOutput!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Animation with duration
    func animate(_ animation: @escaping () -> Void, completion: ((_ result: Bool) -> Void)? = nil) {
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            guard let strongSelf = self else { return }
            animation()
            strongSelf.view.layoutIfNeeded()
            }, completion:completion)
    }
    
    func modalViewController(_ viewController: UIViewController) {
        self.present(viewController, animated: true, completion: nil)
    }
}
