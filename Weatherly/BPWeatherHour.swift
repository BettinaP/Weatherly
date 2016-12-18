//
//  BPLocationHour.swift
//  Weatherly
//
//  Created by Bettina on 11/17/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import UIKit

class BPWeatherHour: NSObject {
    
    let timeStamp: NSDate
    let temperature: CGFloat
    let iconName: String
    
    init?(json: NSDictionary) {
        
        guard
            let time = json["time"] as? Double,
            let iconName = json["icon"] as? String,
            let temperature = json["temperature"] as? CGFloat
            else {
                return nil
        }
        
        self.timeStamp = NSDate(timeIntervalSince1970: time)
        self.iconName = iconName
        self.temperature = temperature
    }
}
