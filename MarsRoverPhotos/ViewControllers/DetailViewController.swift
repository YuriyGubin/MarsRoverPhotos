//
//  DetailViewController.swift
//  MarsRoverPhotos
//
//  Created by Юрий Губин on 07.11.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet var photoImage: UIImageView!
    
    @IBOutlet var descriptionLabel: UILabel!
    
    var detail: PhotoElement!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        photoImage.image = UIImage(named: detail.imageSource)
        descriptionLabel.text = detail.description
        
        NetworkManager.shared.fetchImage(from: detail.imageSource) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.photoImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}

