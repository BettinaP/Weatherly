//
//  BPLocationDay.swift
//
//
//  Created by Bettina on 12/21/16.
//
//

import UIKit

class BPLocationDay: NSObject {
    
    var weekday : String
    let dailyIconName : String
    let dailyMaxTemp: Int
    let dailyMinTemp : Int
    let dailyTime: Double
    
    init?(jsonDaily: NSDictionary) {
        
        guard
            let iconName = jsonDaily["icon"] as? String,
            let maxTemp = jsonDaily["temperatureMax"] as? Int,
            let minTemp = jsonDaily["temperatureMin"] as? Int,
            let time = jsonDaily["time"] as? Double
            else {
                return nil
        }
        
        self.weekday = "N/A"
        self.dailyIconName = iconName
        self.dailyMaxTemp = maxTemp
        self.dailyMinTemp = minTemp
        self.dailyTime = time
        
    }
    
}
