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
        
        photoRoverImage.image = UIImage(named: photo.img_src)
        photoRoverImage.layer.cornerRadius = photoRoverImage.frame.size.height / 2
        photoRoverImage.clipsToBounds = true
    }

}
