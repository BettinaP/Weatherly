//
//  BPLocationHourly.swift
//  Weatherly
//
//  Created by Bettina on 11/17/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import UIKit

class BPWeatherHourly {
    
    var hours = [BPWeatherHour]()
    
    init?(json: NSDictionary) {
        
        guard let hourlyDict = json["hourly"] as? NSDictionary, let hourlyDataArray = hourlyDict["data"] as? NSArray else {
            return nil
        }
        
        for hourDict in hourlyDataArray {
            if let hourDict = hourDict as? NSDictionary, let hour = BPWeatherHour(json: hourDict) {
                hours.append(hour)
            }
        }
        
        if hours.count == 0 {
            return nil
        }
    }
}
