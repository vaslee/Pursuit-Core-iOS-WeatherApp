//
//  WeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by TingxinLi on 1/21/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class WeatherCell: UICollectionViewCell {
    
    @IBOutlet weak var datesOfWeather: UILabel!
    
    @IBOutlet weak var imageOfWeather: UIImageView!
    @IBOutlet weak var highestTemp: UILabel!
    @IBOutlet weak var lowestTemp: UILabel!
    
    public func configureWeather(weather: Weather) {
        
        
        
      
        datesOfWeather.text = weather.dateFormattedDateTimeISO
        highestTemp.text = "High: " + weather.maxTempF.description + "ºF"
        lowestTemp.text = "Low: " + weather.minTempF.description + "ºF"
        
//        ImageHelper.shared.fetchImage(urlString: weather.) { (appError, image) in
//            if let appError = appError {
//                print(appError.errorMessage())
//            } else if let image = image {
//
//                self.magicPicture.image = image
//
//            }
//        }
//        self.detailActivity.stopAnimating()
    }
}
