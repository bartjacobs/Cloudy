//
//  Conversions.swift
//  Cloudy
//
//  Created by Bart Jacobs on 03/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import Foundation

extension Double {

    func toCelcius() -> Double {
        return ((self - 32.0) / 1.8)
    }

    func toKPH() -> Double {
        return (self * 1.609344)
    }

}
