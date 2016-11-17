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
    
    class func getForecast(location: CLLocation, completion: () -> (BPLocation?)) {
        
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        let path = String(format: kAPIWeatherForecast, kAPIKey, latitude, longitude)
        
        Alamofire.request(.GET, path).validate().responseJSON { (response) in
            
            switch response.result {
                
            case .Success:
                
                if let json = response.result.value as? NSDictionary, let location = BPLocation(json: json) {
                    completion(location)
                } else {
                    completion(nil)
                }
                
            case .Failure(let error):
                print(error)
            }
        }
    }
}