//
//  BPLocationDaily.swift
//  Weatherly
//
//  Created by Bettina on 11/17/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import UIKit

class BPWeatherDaily: NSObject {

    var days = [BPWeatherDay]()
    
    var todayDetails = [BPWeatherDay]()
    var today = NSDate()
    var todaysMaxTemp = Int()
    var todaysMinTemp = Int()
    
    init?(json: NSDictionary) {
        
        
        
        guard let dailyDict = json["daily"] as? NSDictionary, let dailyDataArray = dailyDict["data"] as? NSArray else {
            return nil
        }
        
        for dayDict in dailyDataArray {
            if let dayDict = dayDict as? NSDictionary, let day = BPWeatherDay(json: dayDict) {
                days.append(day)
            }
            
            
            let todaysDateString = today.getDayStamp()
            let dayOfWeekDateString = NSDate(timeIntervalSince1970:day.dailyTime).getDayStamp()
            
            if todaysDateString == dayOfWeekDateString{
                todaysMaxTemp = dailyTempMax
                todaysMinTemp = dailyTempMin
                continue
            } else {
                self.days.append(day)
            }
        }
        
        
        if days.count == 0 {
            return nil
        }
    }
}
