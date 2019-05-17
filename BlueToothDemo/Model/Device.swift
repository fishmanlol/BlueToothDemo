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
    var data: Any?
    let type: DeviceType
    
    init(uuid: String?, type: DeviceType) {
        self.uuid = uuid
        self.type = type
    }
    
    static func ==(lhs: Device, rhs: Device) -> Bool {
        
        return lhs.type.name == rhs.type.name
        
    }
    
}

enum DeviceType: CaseIterable {
    case pulseOximeter, earThermometer, scale
    
    var name: String {
        
        switch self {
        case .pulseOximeter:
            return "Pulse Oximeter"
        case .earThermometer:
            return "Ear Thermometer"
        case .scale:
            return "Electronic Scale"
        }
    }
    
    var serviceUuid: CBUUID {
        
        switch self {
        case .pulseOximeter:
            return CBUUID(string: "49535343-FE7D-4AE5-8FA9-9FAFD205E455")
        default:
            return CBUUID(string: "49535343-FE7D-4AE5-8FA9-9FAFD205E455")
        }
    }
    
    var characteristicUuid: CBUUID {
        
        switch self {
        case .pulseOximeter:
            return CBUUID(string: "49535343-1E4D-4BD9-BA61-23C647249616")
        default:
            return CBUUID(string: "49535343-1E4D-4BD9-BA61-23C647249616")
        }
    }
}
