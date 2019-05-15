//
//  ViewController.swift
//  BlueToothDemo
//
//  Created by Yi Tong on 5/14/19.
//  Copyright © 2019 Yi Tong. All rights reserved.
//

import UIKit
import SnapKit

class VitalSignController: UIViewController {
    
    weak var devicesTableView: UITableView!
    weak var continueButton: UIButton!
    
    let vm = VitalSignViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        title = "Vital Sign"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTapped))
        
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        devicesTableView = tableView
        view.addSubview(devicesTableView)
        
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.defaultRed
        button.setAttributedTitle(NSAttributedString(string: "Continue", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]), for: .normal)
        continueButton = button
        view.addSubview(continueButton)
    }
    
    @objc private func editButtonTapped() {
        print(#function)
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
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(44)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(24)
            make.bottom.equalTo(continueButton.snp.top).offset(-36)
        }
    }

}

extension VitalSignController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.devicesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
}

extension VitalSignController: UITableViewDelegate {
    
}
