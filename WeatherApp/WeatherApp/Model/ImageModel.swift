//
//  ImageModel.swift
//  WeatherApp
//
//  Created by TingxinLi on 1/21/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct ImageData: Codable {
    let hits: [ImageWarpper]
}

struct ImageWarpper: Codable {
    let largeImageURL: String
}
