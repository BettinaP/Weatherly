//
//  BPLocationDay.swift
//  Weatherly
//
//  Created by Bettina on 12/18/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import Foundation

class BPWeatherDay: NSObject {

    
    var dailyIconName: String
    var dailyTime: NSDate
    var dailyTempMin: Int
    var dailyTempMax: Int

    
    
    init?(json: NSDictionary) {
        
        guard
            let time = json["time"] as? Double,
            let iconName = json["icon"] as? String,
            let tempMin = json["temperatureMin"] as? Int,
            let tempMax = json["temperatureMax"] as? Int
            else {
                return nil
        }
        
        self.dailyTime = NSDate(timeIntervalSince1970: time)
        self.dailyIconName = iconName
        self.dailyTempMin = tempMin
        self.dailyTempMax = tempMax
    }
}
