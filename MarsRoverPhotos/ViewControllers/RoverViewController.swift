//
//  RoverViewController.swift
//  MarsRoverPhotos
//
//  Created by Юрий Губин on 09.11.2022.
//

import UIKit

class RoverViewController: UITableViewController {
    
    enum Link: String {
        case url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&page=2&api_key=DEMO_KEY"
    }
    
    private let roverPhoto: [Photo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPhotos()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...

        return cell
    }


    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

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
