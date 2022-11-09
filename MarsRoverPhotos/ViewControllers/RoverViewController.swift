//
//  RoverViewController.swift
//  MarsRoverPhotos
//
//  Created by Юрий Губин on 09.11.2022.
//

import UIKit

class RoverViewController: UITableViewController {
    
  
    
    private let photoRover: Photo? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPhotos()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        photoRover?.photos.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomViewCell
        let photo = photoRover?.photos[indexPath.row]
        
        cell.photoRoverImage.image = UIImage(named: photo?.img_src ?? "")
        cell.roverNameLabel.text = photo?.rover.name
        cell.cameraNameLabel.text = photo?.camera.name
        cell.datePhotoLabel.text = photo?.earth_date
        
        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        detailVC.detail = photoRover?.photos[indexPath.row]
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
