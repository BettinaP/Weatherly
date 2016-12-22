//
//  BPLocationHour.swift
//  Weatherly
//
//  Created by Bettina on 11/17/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import UIKit

class BPLocationHour: NSObject {
    
    let timeStamp: Date
    let temperature: Int
    let iconName: String
    
    init?(jsonHour: NSDictionary) {
        
        guard
            let time = jsonHour["time"] as? Double,
            let iconName = jsonHour["icon"] as? String,
            let temperature = jsonHour["temperature"] as? Int
            else {
                return nil
        }
        
        self.timeStamp = Date(timeIntervalSince1970: time)
        self.iconName = iconName
        self.temperature = temperature
    }
}
//hourly "precipType" value for umbrella reminder check and "summary" for alert message
