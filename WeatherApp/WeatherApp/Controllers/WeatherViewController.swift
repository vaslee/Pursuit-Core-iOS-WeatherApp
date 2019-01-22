//
//  ViewController.swift
//  WeatherApp
//
//  Created by Alex Paul on 1/17/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    var selectCity = String()
    var weather = [Weather]() {
        didSet{
            DispatchQueue.main.async {
            self.weatherCollectionView.reloadData()
            }
        }
    }
    @IBOutlet weak var weatherCollectionView: UICollectionView!
    
    @IBOutlet weak var nameOfCity: UILabel!
    @IBOutlet weak var zipCode: UITextField!
    @IBOutlet weak var notes: UILabel!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        weatherCollectionView.dataSource = self
        weatherCollectionView.delegate = self
        zipCode.delegate = self
        weatherInfo(keyword: "11323")
    
        notes.text = "Enter a Zip Code"
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedCell = sender as? UICollectionViewCell,
            let indexPath = weatherCollectionView.indexPath(for: selectedCell),
            let DetailViewController = segue.destination as? WeatherDetailViewController else { fatalError("missing indexPath, WeatherDetailViewController") }
        let weathers = weather[indexPath.row]
        DetailViewController.selectCity = selectCity
        DetailViewController.weatherDetail = weathers
    }
    private func weatherInfo(keyword: String) {
        WeatherAPIClient.searchWeather(keyword: keyword) { (appError, weather) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let weather = weather {
                self.weather = weather
            }
        }
    }
    
    
}
    
extension WeatherViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weather.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as? WeatherCell else {
            fatalError("WeatherCell error")
        }
    
        let cellInfo = weather[indexPath.row]
        cell.configureWeather(weather: cellInfo)
        cell.imageOfWeather.image = UIImage(named: cellInfo.icon)
        
        return cell
    }
}

extension WeatherViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text {
            ZipCodeHelper.getLocationName(from: text) { (error, location) in
               if let error = error {
                    print("No location found")
               } else if let location = location {
                self.nameOfCity.text = "Weather Forecast for \(location)"
                self.selectCity = location
                self.weatherInfo(keyword: text)
                }
            }
        }
        return true
    }
}
