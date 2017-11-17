//
//  TreeFactory.swift
//  teste_vaga_iOS
//
//  Created by Felipe perius on 17/11/17.
//  Copyright © 2017 felipe. All rights reserved.
//

import UIKit



final class TreeFactory {
    static var treePool: [String: TreeType] = [:]
    
    
    class func getTree(image: UIImage,name:String,position:CGPoint) -> TreeType? {
        let tree = TreeType.init(name:name, image:image,position:position)
        
        if treePool.index(forKey:name) == nil{
             treePool[name] = TreeType(name:name, image:image,position:position)
        }
        return tree
    }
    
  

}


