//
//  VitalSign.swift
//  BlueToothDemo
//
//  Created by Yi Tong on 5/15/19.
//  Copyright © 2019 Yi Tong. All rights reserved.
//

import Foundation

struct VitalSign {
    let type: VitalSignType
    let device: Device
    var data: Any?
    
    enum VitalSignType {
        case oxygen
        case pulseRate
        case temperature
    }
}
