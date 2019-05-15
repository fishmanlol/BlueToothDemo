//
//  Device.swift
//  TestBlueTooth
//
//  Created by Yi Tong on 5/14/19.
//  Copyright © 2019 Yi Tong. All rights reserved.
//

import Foundation

class Device: Equatable {
    
    var uuid: String?
    let type: DeviceType
    
    init(uuid: String?, type: DeviceType) {
        self.uuid = uuid
        self.type = type
    }
    
    static func ==(lhs: Device, rhs: Device) -> Bool {
        
        return lhs.type.name == rhs.type.name
        
    }
    
}

enum DeviceType {
    case pulseOximeter, earThermometer
    
    var name: String {
        
        switch self {
        case .pulseOximeter:
            return "pulseOximeter"
        case .earThermometer:
            return "earThermometer"
        }
        
    }
}
