////
////  ViewController.swift
////  BlueToothDemo
////
////  Created by Yi Tong on 5/14/19.
////  Copyright © 2019 Yi Tong. All rights reserved.
////
//
import UIKit
//import SnapKit
//
//class DevicesController: UIViewController {
//    
//    weak var devicesScrollView: UIScrollView!
//    weak var container: UIView!
//    weak var poContainer: UIButton!
//    weak var etContainer: UIButton!
//    
//    
//    weak var continueButton: UIButton!
//    
//    let vm = DevicesViewModel()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setup()
//    }
//    
//    private func setup() {
//        title = "Vital Sign"
//        
//        let scrollView = UIScrollView()
//        scrollView.delegate = self
//        devicesScrollView = scrollView
//        view.addSubview(devicesScrollView)
//        
//        let container = UIView()
//        self.container = container
//        devicesScrollView.addSubview(container)
//        
//        let button = UIButton(type: .system)
//        button.backgroundColor = UIColor.defaultRed
//        button.setAttributedTitle(NSAttributedString(string: "Continue", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]), for: .normal)
//        continueButton = button
//        view.addSubview(continueButton)
//        
//        let poContainer = UIButton(type: .system)
//        self.poContainer = poContainer
//        container.addSubview(poContainer)
//        poContainer.setBackgroundImage(UIImage(named: "green_normal"), for: .normal)
////        poContainer.setBackgroundImage(UIImage(named: "green_highlighted"), for: .selected)
//        
//        let etContainer = UIButton(type: .system)
//        self.etContainer = etContainer
//        container.addSubview(etContainer)
//        etContainer.setBackgroundImage(UIImage(named: "gray_normal"), for: .normal)
////        etContainer.setBackgroundImage(UIImage(named: "gray_highlighted"), for: .selected)
//        
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        
//        continueButton.snp.makeConstraints { (make) in
//            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-36)
//            make.centerX.equalToSuperview()
//            make.left.equalToSuperview().offset(24)
//            make.height.equalTo(60)
//        }
//        
//        devicesScrollView.snp.makeConstraints { (make) in
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(44)
//            make.centerX.equalToSuperview()
//            make.left.equalToSuperview().offset(24)
//            make.bottom.equalTo(continueButton.snp.top).offset(-36)
//        }
//        
//        container.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview()
//            make.centerX.equalToSuperview()
//            make.bottom.equalToSuperview().priority(.low)
//            make.centerY.equalToSuperview().priority(.low)
//        }
//        
//        poContainer.snp.makeConstraints { (make) in
//            make.left.equalToSuperview().offset(16)
//            make.right.equalToSuperview().offset(-16)
//            make.height.equalTo(600)
//            make.top.equalToSuperview().offset(8)
//        }
//        
//        etContainer.snp.makeConstraints { (make) in
//            make.left.right.height.equalTo(poContainer)
//            make.top.equalTo(poContainer.snp.bottom).offset(20)
//        }
//    }
//    
//}
//
//extension DevicesController: UIScrollViewDelegate {
//    
//    
//    
//}


