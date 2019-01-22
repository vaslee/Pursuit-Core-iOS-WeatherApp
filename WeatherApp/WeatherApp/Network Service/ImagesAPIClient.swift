//
//  ImagesAPIClient.swift
//  WeatherApp
//
//  Created by TingxinLi on 1/21/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class ImagesAPIClient {
    
    static func searchImages(city: String, completionHandler: @escaping (AppError?, [ImageWarpper]?) -> Void) {
        let city = city.replacingOccurrences(of: " ", with: "+")
        NetworkHelper.shared.performDataTask(endpointURLString: "https://pixabay.com/api/?key=11326237-0b325b88fde6842615c565be5&q=\(city)", httpMethod: "GET", httpBody: nil) { (appError, data, httpResponse) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            guard let response = httpResponse,
                (200...299).contains(response.statusCode) else {
                    let statusCode = httpResponse?.statusCode ?? -999
                    completionHandler(AppError.badStatusCode(String(statusCode)), nil)
                    return
            }
            if let data = data {
                do {
                    let imageData = try JSONDecoder().decode(ImageData.self, from: data)
                    completionHandler(nil, imageData.hits)
                } catch {
                    completionHandler(AppError.decodingError(error), nil)
                }
            }
        }
    }
    
    
    
    
    
//    static func getFavorites(completionHandler: @escaping (AppError?, [Favorite]?) -> Void) {
//        let getFavoritesEndpoint = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/favorites"
//        NetworkHelper.shared.performDataTask(endpointURLString: getFavoritesEndpoint, httpMethod: "GET", httpBody: nil) { (appError, data, httpResponse) in
//            if let appError = appError {
//                completionHandler(appError, nil)
//            }
//            guard let response = httpResponse,
//                (200...299).contains(response.statusCode) else {
//                    let statusCode = httpResponse?.statusCode ?? -999
//                    completionHandler(AppError.badStatusCode(String(statusCode)), nil)
//                    return
//            }
//            if let data = data {
//                do {
//                    let favorites = try JSONDecoder().decode([Favorite].self, from: data)
//                    completionHandler(nil, favorites)
//                } catch {
//                    completionHandler(AppError.decodingError(error), nil)
//                }
//            }
//        }
//    }
//
}
