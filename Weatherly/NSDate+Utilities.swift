//
//  NSDate+Utilities.swift
//  WeatherApp
//
//  Created by Bettina on 11/11/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import UIKit

extension Date {

    func dayOfWeekString() -> String {
        
        let dateformatter  = DateFormatter()
        dateformatter.dateFormat = "EEEE"
        
        return dateformatter.string(from: self)
    }
    
    func hourWithoutMinutesString() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short
        dateFormatter.dateFormat = "h a"
        
        return dateFormatter.string(from: self)
    }
}
