//
//  CustomViewCell.swift
//  MarsRoverPhotos
//
//  Created by Yuriy on 09.11.2022.
//

import UIKit

class CustomViewCell: UITableViewCell {

    @IBOutlet var roverImage: UIImageView!

    @IBOutlet var photoInfo: UILabel!
    
    func configure(with photo: PhotoElement) {
        photoInfo.text = photo.description
        
        DispatchQueue.global().async {
            let stringUrl = photo.imageSource
            guard let imageUrl = URL(string: stringUrl) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.roverImage.image = UIImage(data: imageData)
            }
        }
        
        roverImage.layer.shadowColor = UIColor.black.cgColor
        roverImage.layer.shadowOffset = CGSize(width: 0, height: 5)
        roverImage.layer.shadowOpacity = 0.8
        roverImage.layer.shadowRadius = 6
        roverImage.layer.masksToBounds = false
        
        
    }

}
