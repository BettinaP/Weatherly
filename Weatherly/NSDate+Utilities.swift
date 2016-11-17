//
//  NSDate+Utilities.swift
//  WeatherApp
//
//  Created by Bettina on 11/11/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import UIKit

extension NSDate {

    func dayOfWeekString() -> String {
        
        let dateformatter  = NSDateFormatter()
        dateformatter.dateFormat = "EEEE"
        
        return dateformatter.stringFromDate(self)
    }
    
    func hourWithoutMinutesString() -> String {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateFormat = "h a"
        dateFormatter.timeZone = NSTimeZone()
        
        return dateFormatter.stringFromDate(self)
    }
}
