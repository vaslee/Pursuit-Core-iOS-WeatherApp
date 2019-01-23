//
//  WeatherAPIClient.swift
//  WeatherApp
//
//  Created by TingxinLi on 1/20/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class WeatherAPIClient {
    
    static func searchWeather(keyword: String, completionHandler: @escaping (AppError?, [Weather]?) -> Void) {
        
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.aerisapi.com/forecasts/\(keyword)?client_id=f5ARo55Pe1Oe7qNARkuUW&client_secret=JEqBhztTlk7nLe08QABLkOzBwohVO2MZFPq3fFCp", httpMethod: "GET", httpBody: nil) { (appError, data, httpResponse) in
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
                    let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                    if let response = weatherData.response {
                        if let responseData = response.first {
                        completionHandler(nil, responseData.periods)
                        }
                    }
                    
                } catch {
                    completionHandler(AppError.decodingError(error), nil)
                }
            }
        }
    }
    
}
