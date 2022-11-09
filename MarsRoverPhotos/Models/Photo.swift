//
//  Photo.swift
//  MarsRoverPhotos
//
//  Created by Юрий Губин on 07.11.2022.
//

struct Photo: Decodable {
    let photos: [PhotoElement]
}

struct PhotoElement: Decodable {
    let id: Int
    let sol: Int
    let camera: Camera
    let img_src: String
    let earth_date: String
    let rover: Rover
    
    var description: String {
        """
        Rover: \(rover.name)
        Camera: \(camera.name)
        Date: \(earth_date)
        """
    }
}

struct Camera: Decodable {
    let id: Int
    let name: String
    let rover_id: Int
    let full_name: String
}

struct Rover: Decodable {
    let id: Int
    let name: String
    let landing_date: String
    let launch_date: String
    let status: String
}
