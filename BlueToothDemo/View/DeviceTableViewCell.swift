//
//  DeviceTableViewCell.swift
//  BlueToothDemo
//
//  Created by Yi Tong on 5/14/19.
//  Copyright © 2019 Yi Tong. All rights reserved.
//

import UIKit

class DeviceTableViewCell: UITableViewCell {
    
    weak var deviceNameLabel: UILabel?
    weak var oxygenLable: UILabel?
    weak var oxygenDataLabel: UILabel?

    var hasValue: Bool = false {
        didSet {
            changeBackgroundView(hasValue: hasValue)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       hasValue = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func changeBackgroundView(hasValue: Bool) {
        let view = UIView()
        view.layer.cornerRadius = 10.0
        view.layer.masksToBounds = true
        if hasValue {
            view.backgroundColor = UIColor(r: 143, g: 214, b: 159)
        } else {
            view.layer.borderColor = UIColor(r: 170, g: 170, b: 170).cgColor
            view.layer.borderWidth = 1.0
        }
        backgroundView = view
    }
    

}
