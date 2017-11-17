//
//  ViewController.swift
//  teste_vaga_iOS
//
//  Created by Felipe perius on 15/11/17.
//  Copyright © 2017 felipe. All rights reserved.
//

import UIKit

protocol ContainerPhotoDelegate{
    func changePhoto(image:UIImage)
}
class HomeViewController: UIViewController {

    @IBOutlet weak var photoContainer: UIView!
    var containerPhotoView: ContainerPhotoViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func reloadPhoto(_ sender: Any) {
        self.getPicture()
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "containerViewSegue" {
            containerPhotoView = segue.destination as? ContainerPhotoViewController
        }
    }
    
}

extension HomeViewController{
    func getPicture(){
        self.view.lock()
        NasaDAO.getDataFromAPI { (data) in
            NasaDAO.downloadImage(at: data["url"]!, completion: { (success, image) in
                if success == true {
                    DispatchQueue.main.async {
                        self.containerPhotoView?.changeImage(image:image)
                        self.view.unlock()
                    }
                } else {
                     self.view.unlock()
                }
            })
        }
    }
}
