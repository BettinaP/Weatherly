//
//  BPLocationHourly.swift
//  Weatherly
//
//  Created by Bettina on 11/17/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import UIKit

class BPLocationHourly {
    
    var hours = [BPLocationHour]()
    
    init?(json: NSDictionary) {
        
        guard let hourlyDict = json["hourly"] as? NSDictionary, let hourlyData = hourlyDict["data"] as? NSArray else {
            return nil
        }
        
        for hourDict in hourlyData {
            if let hourDict = hourDict as? NSDictionary, let hour = BPLocationHour(json: hourDict) {
                hours.append(hour)
            }
        }
        
        if hours.count == 0 {
            return nil
        }
    }
}
