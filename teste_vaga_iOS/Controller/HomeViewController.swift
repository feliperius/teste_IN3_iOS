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
    @IBOutlet weak var refreshButton: UIButton!
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
            containerPhotoView?.delegate = self
        }
    }
    
    func generateTree(){
        let SCREEN_WIDTH = UIScreen.main.bounds.size.width
        let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
        let positionX =  CGFloat(arc4random_uniform(UInt32(SCREEN_WIDTH)))
        let positionY =  CGFloat(arc4random_uniform(UInt32(SCREEN_HEIGHT)))
        FlyWeighFlorest.plantTree(image:#imageLiteral(resourceName: "img_tree"), position:CGPoint(x:positionX, y:positionY), name:"tree", viewController:self)
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
                        self.refreshButton.isHidden = true
                    }
                } else {
                     self.view.unlock()
                }
            })
        }
    }
}

extension HomeViewController:CreateTreeProtocol{
    func createTree() {
        self.refreshButton.isHidden = false
        self.generateTree()
    }
}
