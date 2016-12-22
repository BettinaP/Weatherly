//
//  BPLocationCurrent.swift
//  Weatherly
//
//  Created by Bettina on 11/17/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import UIKit

class BPLocationCurrent: NSObject {
    
    var cityName : String
    let currentIconName : String
    let currentTemp : Int
    let currentTime : Double
    let currentTimeZone : String
    let currentSummary: String
    
    
    init?(json: NSDictionary) {
        
        guard
            let currentlyDict = json["currently"] as? NSDictionary,
            let iconName = currentlyDict["icon"] as? String,
            let time = currentlyDict["time"] as? Double,
            let temp = currentlyDict["temperature"] as? Int,
            let timeZone = currentlyDict["timezone"] as? String,
            let summary = currentlyDict["summary"] as? String
            else {
                return nil
        }
        
        self.cityName = "N/A"
        self.currentIconName = iconName
        self.currentTime = time
        self.currentTemp = temp
        self.currentTimeZone = timeZone
        self.currentSummary = summary
        print("in currently init and time is \(self.currentTime)")
    }
    
}
