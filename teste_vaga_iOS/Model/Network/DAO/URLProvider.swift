//
//  URLProvider.swift
//  teste_vaga_iOS
//
//  Created by Felipe perius on 15/11/17.
//  Copyright © 2017 felipe. All rights reserved.
//

import UIKit

class URLProvider: NSObject {
    
    static let urlString = "https://api.nasa.gov/planetary/apod?api_key=NNKOjkoul8n1CH18TWA9gwngW1s1SmjESPjNoUFo"
    
    
    class var baseURL: URL {
        return  URL(string: urlString)!
    }
    

}
