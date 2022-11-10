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
    let imageSource: String
    let earthDate: String
    let rover: Rover
    
    var description: String {
        """
        Rover: \(rover.name)
        Camera: \(camera.name)
        Date: \(earthDate)
        """
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case sol = "sol"
        case camera = "camera"
        case imageSource = "img_src"
        case earthDate = "earth_date"
        case rover = "rover"
    }
}

struct Camera: Decodable {
    let id: Int
    let name: String
    let roverID: Int
    let fullName: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case roverID = "rover_id"
        case fullName = "full_name"
    }
}

struct Rover: Decodable {
    let id: Int
    let name: String
    let landingDate: String
    let launchDate: String
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status = "status"
    }
}
