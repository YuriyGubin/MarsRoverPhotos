//
//  DetailViewController.swift
//  MarsRoverPhotos
//
//  Created by Юрий Губин on 07.11.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet var photoImage: UIImageView!
    
    var detail: PhotoElement!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    private func setupViews() {
        photoImage.image = UIImage(named: detail.img_src)
    }

    
}
