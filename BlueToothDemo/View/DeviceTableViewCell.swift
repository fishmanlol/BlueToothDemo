//
//  DeviceTableViewCell.swift
//  BlueToothDemo
//
//  Created by Yi Tong on 5/14/19.
//  Copyright © 2019 Yi Tong. All rights reserved.
//

import UIKit

class DeviceTableViewCell: UITableViewCell {
    
    weak var bgView: UIView!
    weak var deviceNameLabel: UILabel!
    weak var oxygenLabel: UILabel!
    weak var oxygenDataLabel: UILabel!
    weak var pulseLabel: UILabel!
    weak var pulseDataLabel: UILabel!
    weak var tapCover: UIButton!
    
    lazy var greenBackgroundView: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "green_normal"), for: .normal)
        button.setBackgroundImage(UIImage(named: "green_highlighted"), for: .selected)
        return button
    }()
    
    lazy var emptyBackgroundView: UIView = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "gray_normal"), for: .normal)
        button.setBackgroundImage(UIImage(named: "gray_highlighted"), for: .selected)
        return button
    }()
    
    var allTextColor: UIColor = .white {
        didSet {
            oxygenLabel.textColor = allTextColor
            oxygenDataLabel.textColor = allTextColor
            pulseLabel.textColor = allTextColor
            pulseDataLabel.textColor = allTextColor
            deviceNameLabel.textColor = allTextColor
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup() {
        
        let bgView = UIView()
        self.bgView = bgView
        addSubview(bgView)
        
        backgroundView = emptyBackgroundView
        
        let deviceNameLabel = UILabel()
        deviceNameLabel.textAlignment = .center
        contentView.addSubview(deviceNameLabel)
        self.deviceNameLabel = deviceNameLabel
        
        let oxygenLabel = UILabel()
        contentView.addSubview(oxygenLabel)
        self.oxygenLabel = oxygenLabel
        
        let oxygenDataLabel = UILabel()
        contentView.addSubview(oxygenDataLabel)
        self.oxygenDataLabel = oxygenDataLabel
        
        let pulseLabel = UILabel()
        contentView.addSubview(pulseLabel)
        self.pulseLabel = pulseLabel
        
        let pulseDataLabel = UILabel()
        contentView.addSubview(pulseDataLabel)
        self.pulseDataLabel = pulseDataLabel
        
        let tapCover = UIButton()
        tapCover.alpha = 0.011
        self.tapCover = tapCover
        contentView.addSubview(tapCover)
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        deviceNameLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        oxygenLabel.snp.makeConstraints({ (make) in
            make.left.equalToSuperview().offset(12)
            make.top.equalToSuperview().offset(12)
            make.height.equalTo(20)
        })
        
        oxygenDataLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(oxygenLabel.snp.right).offset(6)
            make.top.equalToSuperview().offset(12)
            make.height.equalTo(20)
        })

        pulseLabel.snp.makeConstraints { (make) in
            make.left.equalTo(oxygenLabel)
            make.top.equalTo(oxygenLabel.snp.bottom).offset(12)
            make.height.equalTo(20)
        }
        
        pulseDataLabel.snp.makeConstraints { (make) in
            make.left.equalTo(pulseLabel.snp.right).offset(6)
            make.top.equalTo(oxygenDataLabel.snp.bottom).offset(12)
            make.height.equalTo(20)
        }
        
        tapCover.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func fillBackgroudView() {
        backgroundView = greenBackgroundView
    }
    
    func emptyBackgrondView() {
        backgroundView = emptyBackgroundView
    }
}
