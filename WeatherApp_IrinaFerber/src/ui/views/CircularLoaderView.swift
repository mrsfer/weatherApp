//
//  CircularLoaderView.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 08.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import Foundation
import UIKit

class CircularLoaderView: UIView {
    
    let circlePathLayer = CAShapeLayer()
    let circleRadius: CGFloat = 17.0
    
    var privateProgress: CGFloat = 0
    var progress: CGFloat {
        get {
            return privateProgress
        }
        set {
            privateProgress = newValue
            
            let intNewValue = CGFloat(Int(newValue))
            let diff = newValue - intNewValue
            
            if diff > 0.5 {
                circlePathLayer.strokeStart = (diff - 0.5) * 2
                circlePathLayer.strokeEnd = 1
            } else if diff >= 0 && diff <= 0.5 {
                circlePathLayer.strokeStart = 0
                circlePathLayer.strokeEnd = diff * 2
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure() {
        progress = 0
        circlePathLayer.frame = bounds
        circlePathLayer.lineWidth = 2
        circlePathLayer.fillColor = UIColor.clear.cgColor
        circlePathLayer.strokeColor = UIColor.lightblueColor().cgColor
        circlePathLayer.actions = [
            "strokeEnd" : NSNull(),
            "strokeStart" : NSNull()
        ]
        layer.addSublayer(circlePathLayer)
        backgroundColor = UIColor(white: 0x000000, alpha: 0.3)
    }
    
    func start() {
        progress = 0
        updateTimer()
    }
    
    func stop() {
    }
    
    deinit {
        stop()
    }
    
    // MARK: - private
    
    func updateTimer() {
        delay(0.01) { [weak self] in
            DispatchQueue.main.async(execute: {
                self?.progress += 0.01
                self?.updateTimer()
            })
        }
    }
    
    func circleFrame() -> CGRect {
        var circleFrame = CGRect(x: 0, y: 0, width: 2*circleRadius, height: 2*circleRadius)
        circleFrame.origin.x = circlePathLayer.bounds.midX - circleFrame.midX
        circleFrame.origin.y = circlePathLayer.bounds.midY - circleFrame.midY
        return circleFrame
    }
    
    func circlePath() -> UIBezierPath {
        return UIBezierPath(ovalIn: circleFrame())
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circlePathLayer.frame = bounds
        circlePathLayer.path = circlePath().cgPath
    }
}
