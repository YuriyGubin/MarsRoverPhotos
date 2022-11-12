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
        descriptionLabel.text = detail.secondDescription
        title = "Photo ID: \(detail.id)"
        
        NetworkManager.shared.fetchImage(from: detail.imageSource) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.photoImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
        photoImage.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        photoImage.layer.shadowOffset = CGSize(width: 0, height: 10)
        photoImage.layer.shadowOpacity = 1
        photoImage.layer.shadowRadius = 5
        photoImage.layer.masksToBounds = false
    }
}

