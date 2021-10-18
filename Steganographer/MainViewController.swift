//
//  ViewController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 18/10/2021.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var headerView : UIView = {
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
//        headerView.backgroundColor = .purple
        return headerView
    }()
    
    lazy var headerTitle : UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Steganographer"
        title.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return title
    }()
    
    lazy var infoButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(systemName: "info.circle.fill"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    
    private func setupLayout() {
        view.addSubview(headerView)
        
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        headerView.addSubview(headerTitle)
        headerView.addSubview(infoButton)
        
        infoButton.centerYAnchor.constraint(equalTo: headerTitle.centerYAnchor).isActive = true
        infoButton.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 16).isActive = true
        infoButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        infoButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        headerTitle.topAnchor.constraint(equalTo: headerView.topAnchor, constant: view.bounds.height * 0.05).isActive = true
        headerTitle.leftAnchor.constraint(equalTo: infoButton.rightAnchor, constant: 16).isActive = true
    }
    

}

