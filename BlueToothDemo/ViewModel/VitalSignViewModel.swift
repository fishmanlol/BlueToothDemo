//
//  VitalSignViewModel.swift
//  BlueToothDemo
//
//  Created by Yi Tong on 5/14/19.
//  Copyright © 2019 Yi Tong. All rights reserved.
//

import Foundation

class VitalSignViewModel {
    
    var devices: [Device] = []
    
    init() {
        let poDevice = PODevice(uuid: nil, type: .pulseOximeter)
        let etDevice = ETDevice(uuid: nil, type: .earThermometer)
        
        devices.append(contentsOf: [poDevice, etDevice])
    }
    
    func devicesCount() -> Int {
        return devices.count
    }
    
}
