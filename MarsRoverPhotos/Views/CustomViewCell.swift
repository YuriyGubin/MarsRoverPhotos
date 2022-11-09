//
//  CustomViewCell.swift
//  MarsRoverPhotos
//
//  Created by Yuriy on 09.11.2022.
//

import UIKit

class CustomViewCell: UITableViewCell {

    @IBOutlet var photoRoverImage: UIImageView!

    @IBOutlet var photoInfo: UILabel!
    
    func configure(with photo: PhotoElement) {
        photoInfo.text = photo.description
        
        DispatchQueue.global().async {
            let stringUrl = photo.imageSource
            guard let imageUrl = URL(string: stringUrl) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.photoRoverImage.image = UIImage(data: imageData)
            }
        }
        

//        photoRoverImage.layer.cornerRadius = photoRoverImage.frame.size.height / 2
//        photoRoverImage.clipsToBounds = true
    }

}
