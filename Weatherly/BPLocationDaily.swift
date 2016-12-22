//
//  BPLocationDaily.swift
//  Weatherly
//
//  Created by Bettina on 12/21/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import UIKit

class BPLocationDaily: NSObject {
    
    fileprivate(set) var days = [BPLocationDay]()
    fileprivate(set) var today = Date()
    fileprivate(set) var todayMaxTemp = Int()
    fileprivate(set) var todayMinTemp = Int()
    
    
    init?(jsonDaily: NSDictionary) {
        
        guard let dailyDict = jsonDaily["daily"] as? NSDictionary, let dailyDataArray = dailyDict["data"] as? NSArray else {
            return nil
        }
        
        for dayDict in dailyDataArray {
            if let dayDict = dayDict as? NSDictionary, let day = BPLocationDay(jsonDaily: dayDict) {
                let todayDateString = today.dayOfWeekString()
                let dayOfWeekDateString = Date(timeIntervalSince1970: day.dailyTime).dayOfWeekString()
                
                if todayDateString == dayOfWeekDateString {
                    todayMaxTemp = day.dailyMaxTemp
                    todayMinTemp = day.dailyMinTemp
                    continue
                } else {
                    days.append(day)
                }
            }
        }
        
        if days.count == 0 {
            return nil
        }
    }
}
