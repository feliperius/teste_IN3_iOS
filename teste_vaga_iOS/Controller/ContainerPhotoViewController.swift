//
//  ModalPhotoViewController.swift
//  teste_vaga_iOS
//
//  Created by Felipe perius on 16/11/17.
//  Copyright © 2017 felipe. All rights reserved.
//

import UIKit

protocol CreateTreeProtocol {
    func createTree()
}

class ContainerPhotoViewController: UIViewController {
 
    @IBOutlet weak var photoImageVIew: UIImageView!
    var delegate:CreateTreeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func dissmisModal(_ sender: Any) {
        self.view.isHidden = true
        self.delegate?.createTree()
    }
    
    func changeImage(image:UIImage?) {
       self.photoImageVIew.image = image
       self.view.isHidden = false
    }

}
