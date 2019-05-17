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
    weak var earThemometerLabel: UILabel!
    weak var earThemometerDataLabel: UILabel!
    weak var scaleLabel: UILabel!
    weak var scaleDataLabel: UILabel!
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
            earThemometerLabel.textColor = allTextColor
            earThemometerDataLabel.textColor = allTextColor
            scaleLabel.textColor = allTextColor
            scaleDataLabel.textColor = allTextColor
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
        
        let earThemometerLabel = UILabel()
        contentView.addSubview(earThemometerLabel)
        self.earThemometerLabel = earThemometerLabel
        
        let earThemometerDataLabel = UILabel()
        contentView.addSubview(earThemometerDataLabel)
        self.earThemometerDataLabel = earThemometerDataLabel
        
        let scaleLabel = UILabel()
        contentView.addSubview(scaleLabel)
        self.scaleLabel = scaleLabel
        
        let scaleDataLabel = UILabel()
        contentView.addSubview(scaleDataLabel)
        self.scaleDataLabel = scaleDataLabel
        
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
        
        let maxTop: CGFloat = 12
        let maxHeight: CGFloat = 20
        
        oxygenLabel.snp.remakeConstraints({ (make) in
            make.left.equalToSuperview().offset(12)
            make.top.equalToSuperview().offset(oxygenLabel.text == nil ? 0 : maxTop)
            make.height.equalTo(oxygenLabel.text == nil ? 0 : maxHeight)
        })
        
        oxygenDataLabel.snp.remakeConstraints({ (make) in
            make.left.equalTo(oxygenLabel.snp.right).offset(6)
            make.top.equalToSuperview().offset(oxygenLabel.text == nil ? 0 : maxTop)
            make.height.equalTo(oxygenLabel.text == nil ? 0 : maxHeight)
        })

        pulseLabel.snp.remakeConstraints { (make) in
            make.left.equalTo(oxygenLabel)
            make.top.equalTo(oxygenLabel.snp.bottom).offset(pulseLabel.text == nil ? 0 : maxTop)
            make.height.equalTo(pulseLabel.text == nil ? 0 : maxHeight)
        }
        
        pulseDataLabel.snp.remakeConstraints { (make) in
            make.left.equalTo(pulseLabel.snp.right).offset(6)
            make.top.equalTo(oxygenDataLabel.snp.bottom).offset(pulseLabel.text == nil ? 0 : maxTop)
            make.height.equalTo(pulseLabel.text == nil ? 0 : maxHeight)
        }
        
        earThemometerLabel.snp.remakeConstraints { (make) in
            make.left.equalTo(pulseLabel)
            make.top.equalTo(pulseLabel.snp.bottom).offset(earThemometerLabel.text == nil ? 0 : maxTop)
            make.height.equalTo(earThemometerLabel.text == nil ? 0 : maxHeight)
        }
        
        earThemometerDataLabel.snp.remakeConstraints { (make) in
            make.left.equalTo(earThemometerLabel.snp.right).offset(6)
            make.top.equalTo(pulseDataLabel.snp.bottom).offset(earThemometerLabel.text == nil ? 0 : maxTop)
            make.height.equalTo(earThemometerDataLabel.text == nil ? 0 : maxHeight)
        }
        
        scaleLabel.snp.remakeConstraints { (make) in
            make.left.equalTo(pulseLabel)
            make.top.equalTo(pulseLabel.snp.bottom).offset(scaleLabel.text == nil ? 0 : maxTop)
            make.height.equalTo(scaleLabel.text == nil ? 0 : maxHeight)
        }
        
        scaleDataLabel.snp.remakeConstraints { (make) in
            make.left.equalTo(scaleLabel.snp.right).offset(6)
            make.top.equalTo(pulseDataLabel.snp.bottom).offset(scaleLabel.text == nil ? 0 : maxTop)
            make.height.equalTo(scaleDataLabel.text == nil ? 0 : maxHeight)
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
