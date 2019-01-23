//
//  FavoriteImagesViewController.swift
//  WeatherApp
//
//  Created by TingxinLi on 1/18/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteImagesViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var saveWeather = WeatherModel.getWeather()
    var favortiesPhoto = String()
    override func viewDidLoad() {
        super.viewDidLoad()

       tableView.dataSource = self
        tableView.delegate = self
    }
   

}
extension FavoriteImagesViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saveWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavortiesCell", for: indexPath) as? FavortiesCell else {
            fatalError("FavortiesCell error")
        }
        let favorite = saveWeather[indexPath.row]
        if let image = UIImage(data: favorite.imageData) {
            cell.favortiesImage.image = image
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}
