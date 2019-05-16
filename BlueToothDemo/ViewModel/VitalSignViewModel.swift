//
//  VitalSignViewModel.swift
//  BlueToothDemo
//
//  Created by Yi Tong on 5/14/19.
//  Copyright © 2019 Yi Tong. All rights reserved.
//

import Foundation

class VitalSignViewModel {
    
    var vitalSigns: [VitalSign] = []
    
    init() {
        let poDevice = PODevice(uuid: nil, type: .pulseOximeter)
        let oxygenVS = VitalSign(type: .oxygen, device: poDevice, data: nil)
        let pulseVS = VitalSign(type: .pulseRate, device: poDevice, data: nil)
        
        let etDevice = ETDevice(uuid: nil, type: .earThermometer)
        let temperatureVS = VitalSign(type: .temperature, device: etDevice, data: nil)
        
        vitalSigns.append(contentsOf: [oxygenVS, pulseVS, temperatureVS])
    }
    
    func deviceCount() -> Int {
        return DeviceType.AllCases().count
    }
    
}
