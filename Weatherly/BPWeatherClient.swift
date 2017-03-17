//
//  BPWeatherClient.swift
//  Weatherly
//
//  Created by Bettina on 11/17/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class BPWeatherClient {
    
    class func getForecast(location: CLLocation, completion: @escaping (_ forecast: BPForecast?) -> Void) {
        
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        let path = String(format: kAPIWeatherForecast, kAPIKey, latitude, longitude)
        
        Alamofire.request(path, method: .get).validate().responseJSON { (response) in
            
            switch response.result {
                
            case .success:
                
                if let json = response.result.value as? NSDictionary, let forecast = BPForecast(json: json) {
                    completion(forecast)
                } else {
                    completion(nil)
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
