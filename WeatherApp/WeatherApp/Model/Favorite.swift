//
//  Favorite.swift
//  WeatherApp
//
//  Created by TingxinLi on 1/22/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Favorite: Codable {
    let createdAt: String
    let imageData: Data
    
    public var dateFormattedString: String {
        
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = createdAt
        if let date = isoDateFormatter.date(from: createdAt) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy hh:mm a"
            formattedDate = dateFormatter.string(from: date)
        }
        return formattedDate
        
    }
    public var date: Date {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = Date()
        if let date = isoDateFormatter.date(from: createdAt) {
            formattedDate = date
        }
        return formattedDate
    }
}
