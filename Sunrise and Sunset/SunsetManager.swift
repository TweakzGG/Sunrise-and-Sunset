//
//  SunsetManager.swift
//  Sunrise and Sunset
//
//  Created by Jackson Barnes on 8/29/21.
//

import Foundation
import UIKit

protocol SunsetManagerDelegate{
    func didFetchSunset(label: UILabel)
    func didFailWithError(error: Error?)
}

struct SunsetAPIResponse: Codable{
    let sunset: [Sunset]
}

struct Sunset: Codable{
    let sunrise: String
    let sunset: String
    let solar_noon: String
    let day_length: String
}

struct SunsetManager{
    var delegate: SunsetManagerDelegate?
    func fetchSunset() {
        //https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400&date=today
        
        
        
        //Build URL
        guard var baseURL = URL(string: "https://api.sunrise-sunset.org/json") else {
            delegate?.didFailWithError(error: nil)
            return
        }
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        components?.queryItems = [URLQueryItem(name: "lat", value: "long")]
        guard let finalURL = components?.url else {
            delegate?.didFailWithError(error: nil)
            return
        }
        //Send Request
        
        URLSession.shared.dataTask(with: finalURL) { data, _, error in
            
            //Check for Errors
            
            if let error = error {
                delegate?.didFailWithError(error: error)
                return
            }
            
            //Check for Data
            guard let data = data else {
                delegate?.didFailWithError(error: nil)
                return
            }
            //Decode
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode (SunsetAPIResponse.self, from: data)
                let sunset = response.sunset
                delegate?.didFetchSunset(label: )
            } catch {
                delegate?.didFailWithError(error: error)
                return
                
            }.resume()
        }
    }
}
