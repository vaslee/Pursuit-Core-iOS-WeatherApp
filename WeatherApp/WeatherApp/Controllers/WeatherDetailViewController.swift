//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by TingxinLi on 1/18/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    @IBOutlet weak var nameOfCityAndDate: UILabel!
    
    @IBOutlet weak var cityImage: UIImageView!
    
    @IBOutlet weak var weatherInfo: UILabel!
    
    @IBOutlet weak var highTempture: UILabel!
    
    @IBOutlet weak var lowTempture: UILabel!
    
    @IBOutlet weak var sunriseTime: UILabel!
    
    @IBOutlet weak var sunsetTime: UILabel!
    
    @IBOutlet weak var windSpeed: UILabel!
    
    @IBOutlet weak var rainData: UILabel!
    
    var weatherDetail: Weather!
    var selectCity: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectCity
        ImagesAPIClient.searchImages(city: selectCity) { (error, image) in
            if let error = error {
                print(error.errorMessage())
            } else if let images = image {
                //self.cityImage = images
                self.image = images
            }
        }
        highTempture.text = "High: " + weatherDetail.maxTempF.description + "ºF"

        lowTempture.text = "Low: " + weatherDetail.minTempF.description + "ºF"

        sunriseTime.text = "Sunrise: " + weatherDetail.dateFormattedSunriseISO

        sunsetTime.text = "Sunset: " + weatherDetail.dateFormattedSunsetISO

        windSpeed.text = "Winspeed: " + weatherDetail.windSpeedMPH.description

        rainData.text = "Inches of Precipitation: " + weatherDetail.precipIN.description

        weatherInfo.text = weatherDetail.weatherPrimary
        nameOfCityAndDate.text = "Weather Forecast for \(selectCity!) " + "for \(weatherDetail.dateFormattedDateTimeISO)"
    
       
    }
    
    var image = [ImageWarpper]() {
        didSet {
            let imageRandom = Int.random(in: 0..<image.count)
            ImageHelper.fetchImage(urlString: image[imageRandom].largeImageURL ) { (error, image) in
                if let error = error {
                    print(error.errorMessage())
                } else if let images = image {
                    
                    self.cityImage.image = images
                    
                }
                }
            }
    }
}


