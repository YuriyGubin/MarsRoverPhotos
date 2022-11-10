//
//  RoverViewController.swift
//  MarsRoverPhotos
//
//  Created by Юрий Губин on 09.11.2022.
//

import UIKit

class RoverViewController: UITableViewController {
    
    
    private var roverPhoto: Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        fetchPhotos()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        roverPhoto?.photos.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath) as? CustomViewCell else {
            return UITableViewCell()
            
        }
        if let photo = roverPhoto?.photos[indexPath.row] {
            cell.configure(with: photo)
        }
        return cell
    }
    
    // MARK: - Navigation
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let detailVC = segue.destination as? DetailViewController else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            detailVC.detail = roverPhoto?.photos[indexPath.row]
        }
    
    private func fetchPhotos() {
        NetworkManager.shared.fetchPhoto(from: Link.url.rawValue) { [weak self] result in
            switch result {
            case .success(let photo):
                self?.roverPhoto = photo
                self?.tableView.reloadData()
                print(photo)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}

