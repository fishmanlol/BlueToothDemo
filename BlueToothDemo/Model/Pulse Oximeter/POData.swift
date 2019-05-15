//
//  POData.swift
//  TestBlueTooth
//
//  Created by Yi Tong on 5/9/19.
//  Copyright © 2019 Yi Tong. All rights reserved.
//

import Foundation

struct POData {
    var oxygen: Int?
    var pulseRate: Int?
    var recordTime: Date?
    
    init?(data: [AnyHashable: Any]) {
        
//        if let oxygenPulse = data["OxygenPulse"] {
//
//            if let dict = oxygenPulse as? [AnyHashable: Any] {
//
//                if let deviceData = dict["DeviceData1"] as? [[AnyHashable: Any]] {
//
//                } else {
//                    print("2")
//                }
//
//            } else {
//                print("1")
//            }
//
//        } else {
//            print("0")
//        }
        
        guard let oxygenPulse = data["OxygenPulse"], let dict = oxygenPulse as? [AnyHashable: Any], let deviceData = dict["DeviceData1"] as? [[String: Any]], let firstData = deviceData.first else { return nil }
        
        self.oxygen = Int(firstData["Oxygen"] as? String ?? "")
        self.pulseRate = Int(firstData["PulseRate"] as? String ?? "")

        let year = Int(firstData["year"] as? String ?? "")
        let month = Int(firstData["month"] as? String ?? "")
        let day = Int(firstData["day"] as? String ?? "")
        let hour = Int(firstData["hour"] as? String ?? "")
        let min = Int(firstData["min"] as? String ?? "")
        let sec = Int(firstData["sec"] as? String ?? "")

        recordTime = Date(year: year, month: month, day: day, hour: hour, min: min, sec: sec)
    }
}


