//
//  ViewController.swift
//  MarsRoverPhotos
//
//  Created by Юрий Губин on 07.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    enum Link: String {
        case url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=fhaz&api_key=DEMO_KEY"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPhotos()
    }

    private func fetchPhotos() {
        guard let url = URL(string: Link.url.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }

            let decoder = JSONDecoder()
            do {
                let info = try decoder.decode(Photo.self, from: data)
                print(info)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

