//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by TingxinLi on 1/22/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
final class WeatherModel {
    private static let filename = "WeatherList.plist"
    private static var weatherPhoto = [Favorite]()
    
    
    static func saveWeather() {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(weatherPhoto)
            
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
    }
    
    
    static func getWeather() -> [Favorite] {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    weatherPhoto = try PropertyListDecoder().decode([Favorite].self, from: data)
                } catch {
                    print("property list decoding error: \(error)")
                }
            }else {
                print("getPhotoJournal - data is nil")
            }
        } else {
            print("\(filename) does not exist")
        }
        return weatherPhoto
}

    static func addPhoto(item: Favorite) {
        weatherPhoto.append(item)
        saveWeather()
    }
}
