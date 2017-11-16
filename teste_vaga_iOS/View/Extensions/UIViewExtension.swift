//
//  UIViewExtension.swift
//  teste_vaga_iOS
//  Created by Huallyd Smadi on 08/05/16.
//  Copyright © 2016 Huallyd Smadi. All rights reserved.
//

import UIKit

extension UIView {
    func lock(_ duration: TimeInterval = 0.2) {
        
        if let _ = viewWithTag(10) {
            //View is already locked
        }
        else {
            let lockView = UIView(frame: bounds)
            lockView.backgroundColor = UIColor(white: 0.0, alpha: 0.75)
            lockView.tag = 10
            lockView.alpha = 0.0
            let activity = UIActivityIndicatorView(activityIndicatorStyle: .white)
            activity.hidesWhenStopped = true
            
            activity.center = lockView.center
            
            activity.translatesAutoresizingMaskIntoConstraints = false
            
            lockView.addSubview(activity)
            activity.startAnimating()
            
            self.addSubview(lockView)
            
            let xCenterConstraint = NSLayoutConstraint(item: activity, attribute: .centerX, relatedBy: .equal, toItem: lockView, attribute: .centerX, multiplier: 1, constant: 0)
            
            let yCenterConstraint = NSLayoutConstraint(item: activity, attribute: .centerY, relatedBy: .equal, toItem: lockView, attribute: .centerY, multiplier: 1, constant: 0)
            
            
            NSLayoutConstraint.activate([xCenterConstraint, yCenterConstraint])
            
            UIView.animate(withDuration: duration, animations: {
                lockView.alpha = 1.0
            }) 
        }
    }
    
    func unlock(_ duration: TimeInterval = 0.2) {
        if let lockView = self.viewWithTag(10) {
            
            UIView.animate(withDuration: duration, animations: {
                lockView.alpha = 0.0
            }, completion: { finished in
                lockView.removeFromSuperview()
            }) 
        }
    }
}
