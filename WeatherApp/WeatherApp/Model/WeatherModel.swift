//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by TingxinLi on 1/21/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    
    let response: [WeatherWarpper]?
    
}

struct WeatherWarpper: Codable {
    let periods: [Weather]?
    
}

struct Weather: Codable {
    let sunsetISO: String
    public var dateFormattedSunsetISO: String {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = sunsetISO
        if let date = isoDateFormatter.date(from: sunsetISO) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            formattedDate = dateFormatter.string(from: date)
        }
        return formattedDate
    }
    public var date: Date {
        let isoFormatter = ISO8601DateFormatter()
        var formattedDate = Date()
        if let date = isoFormatter.date(from: dateTimeISO) {
            formattedDate = date
        }
        return formattedDate
    }
    let sunriseISO: String
    public var dateFormattedSunriseISO: String {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = sunriseISO
        if let date = isoDateFormatter.date(from: sunriseISO) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            formattedDate = dateFormatter.string(from: date)
        }
        return formattedDate
    }
    public var dateSunrise: Date {
        let isoFormatter = ISO8601DateFormatter()
        var formattedDate = Date()
        if let date = isoFormatter.date(from: dateTimeISO) {
            formattedDate = date
        }
        return formattedDate
    }
    
    let weatherPrimary: String?
    
    let dateTimeISO: String
    public var dateFormattedDateTimeISO: String {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = dateTimeISO
        if let date = isoDateFormatter.date(from: dateTimeISO) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy"
            formattedDate = dateFormatter.string(from: date)
        }
        return formattedDate
    }
    public var dateTime: Date {
        let isoFormatter = ISO8601DateFormatter()
        var formattedDate = Date()
        if let date = isoFormatter.date(from: dateTimeISO) {
            formattedDate = date
        }
        return formattedDate
    }
    let precipIN: Double
    let timestamp: Int
    let maxTempF: Int
    let minTempF: Int
    let windSpeedMPH: Int
    let sunrise: Int
    let sunset: Int
    let icon: String
   
}




