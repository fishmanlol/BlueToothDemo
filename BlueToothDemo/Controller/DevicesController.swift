//
//  ViewController.swift
//  BlueToothDemo
//
//  Created by Yi Tong on 5/14/19.
//  Copyright © 2019 Yi Tong. All rights reserved.
//

import UIKit
import SnapKit

class DevicesController: UIViewController {
    
    weak var devicesTableView: UITableView!
    weak var continueButton: UIButton!
    
    let vm = DevicesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        title = "Vital Sign"
        
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.register(DeviceTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.alwaysBounceVertical = false
        devicesTableView = tableView
        view.addSubview(devicesTableView)
        
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.defaultRed
        button.setAttributedTitle(NSAttributedString(string: "Continue", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]), for: .normal)
        continueButton = button
        view.addSubview(continueButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        continueButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-36)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(24)
            make.height.equalTo(60)
        }
        
        devicesTableView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(24)
            make.bottom.equalTo(continueButton.snp.top).offset(-36)
        }
    }

}

extension DevicesController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DeviceTableViewCell
        cell.selectionStyle = .none
        cell.tapCover.addTarget(self, action: #selector(test), for: .touchUpInside)
        let device = vm.devices[indexPath.section]
        vm.fill(cell, with: device)
    
        return cell
    }
    
    @objc func test() {
        navigationController?.pushViewController(UIViewController(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return vm.devicesCount()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension DevicesController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let device = vm.devices[indexPath.section]
        return vm.deviceCellHeight(for: device)
    }
}


