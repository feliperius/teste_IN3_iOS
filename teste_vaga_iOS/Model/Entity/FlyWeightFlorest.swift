//
//  FlyWeightView.swift
//  teste_vaga_iOS
//
//  Created by Felipe perius on 17/11/17.
//  Copyright © 2017 felipe. All rights reserved.
//

import UIKit

class FlyWeightFlorest {
    
    static var trees:[TreeType] = []
    
    
    class func plantTree(image:UIImage,position:CGPoint,name:String,viewController:UIViewController) {
        guard let tree = TreeFactory.getTree(image:image, name:name,position:position)else {
            return
        }
        trees.append(tree)
        drawTree(viewController:viewController)
    }
    
    class func drawTree(viewController:UIViewController) {
        for tree in FlyWeightFlorest.trees{
            if let treeImageView = tree.imageView {
                viewController.view.addSubview(treeImageView)
            }
        }
    }
}
