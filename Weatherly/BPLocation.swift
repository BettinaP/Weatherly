//
//  BPLocation.swift
//  Weatherly
//
//  Created by Bettina on 11/17/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import UIKit

class BPLocation {
    
    let current: BPLocationCurrent?
    let hourly: BPLocationHourly?
    let daily: BPLocationDaily?
    
    init?(json: NSDictionary) {
        
        current = BPLocationCurrent()
        hourly = BPLocationHourly(json: json)
        daily = BPLocationDaily()
        
        if current == nil || hourly == nil || daily == nil {
            return nil
        }
    }
    
    func locationModels() -> [AnyObject] {
        
        var models = [AnyObject]()
        
        if let current = current {
            models.append(current)
        }
        
        if let hourly = hourly {
            models.append(hourly)
        }
        
        if let daily = daily {
            models.append(daily)
        }
        
        return models
    }
}
