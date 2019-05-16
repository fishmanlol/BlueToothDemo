//
//  DevicesViewModel.swift
//  BlueToothDemo
//
//  Created by Yi Tong on 5/15/19.
//  Copyright © 2019 Yi Tong. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

class DevicesViewModel {
    
    var devices: [Device] = []
    
    init() {
        let poDevice = Device(uuid: nil, type: .pulseOximeter)
        let etDevice = Device(uuid: nil, type: .earThermometer)
        poDevice.data = POData(oxygen: 90, pulseRate: 90)
        
        devices.append(contentsOf: [poDevice, etDevice])
    }
    
    func devicesCount() -> Int {
        return devices.count
    }
    
    func deviceCellHeight(for device: Device) -> CGFloat {
        if let _ = device.data {
            switch device.type {
            case .pulseOximeter:
                return heightForPulseOximeterCell(device)
            case .earThermometer:
                return 44
            }
        } else {
            return 44
        }
    }
    
    private func heightForPulseOximeterCell(_ device: Device) -> CGFloat {
    
        let topMargin: CGFloat = 12.0
        let bottomMargin: CGFloat = 12.0
        
        let topAndBottomMargin: CGFloat = topMargin + bottomMargin
        
        if let poData = device.data as? POData {
            
            var itemsCount = 0
            
            if let _ = poData.oxygen { itemsCount += 1 }
            if let _ = poData.pulseRate { itemsCount += 1 }
            
            return heightForItemsCount(count: itemsCount) + topAndBottomMargin
        }
        
        return 44
    }
    
    private func heightForItemsCount(count: Int) -> CGFloat {
        
        if count == 0 || count == 1 { return 44 }
        
        let middleGap: CGFloat = 12.0
        let labelHieght: CGFloat = 20.0
        
        return labelHieght * CGFloat(count) + middleGap
    }
    
    func fill(_ cell: DeviceTableViewCell, with device: Device) {
        
        if let data = device.data {
            cell.fillBackgroudView()
            cell.allTextColor = .white
            if let poData = data as? POData {
                cell.pulseLabel.text = "Pulse:"
                cell.pulseDataLabel.text = "\(poData.pulseRate ?? 0)%"
                
                cell.oxygenLabel.text = "Oxgen:"
                cell.oxygenDataLabel.text = "\(poData.oxygen ?? 0)/min"
                
                cell.deviceNameLabel.text = nil
                return
            }
        } else {
            cell.oxygenLabel?.text = nil
            cell.oxygenDataLabel?.text = nil
            cell.pulseLabel?.text = nil
            cell.pulseDataLabel?.text = nil
            
            cell.deviceNameLabel?.text = device.type.name
            cell.emptyBackgrondView()
            cell.allTextColor = UIColor(r: 170, g: 170, b: 170)
        }
        
    }
}
