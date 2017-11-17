//
//  TreeType.swift
//  teste_vaga_iOS
//
//  Created by Felipe perius on 17/11/17.
//  Copyright © 2017 felipe. All rights reserved.
//

import UIKit

class TreeType: NSObject {
    var name:String?
    var imageView:UIImageView?
 
    init(name:String,image:UIImage,position:CGPoint) {
        self.name  =  name
        self.imageView =  UIImageView(image:image)
        self.imageView?.frame = CGRect(x:position.x, y:position.y, width:80, height:80)
    }
}
