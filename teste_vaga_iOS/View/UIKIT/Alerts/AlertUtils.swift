//
//  AlertUtils.swift
//  cs-ios
//
//  Created by Felipe perius on 15/03/17.
//  Copyright © 2017 Altran-AIS. All rights reserved.
//

import Foundation
import UIKit

class AlertUtils {

    class func showAlertSuccess(title: String, message: String, viewController: UIViewController?) {

        let alertController = UIAlertController(title: "\(title)", message: message, preferredStyle: .alert)

        let actOk = UIAlertAction(title: "OK", style: .default) {
            _ in
            viewController?.dismiss(animated: true, completion: nil)
        }

        alertController.addAction(actOk)

        if let view = viewController {
            view.present(alertController, animated: true, completion: nil)
        }
    }
    
}


