//
//  ViewController.swift
//  design patterns swift
//
//  Created by Жахaнгир Таиров on 02.03.2023.
//

import UIKit
import FLEX

class ViewController: UIViewController {
    
    private var cardView: UIView {
        let view = UIView(frame: .init(x: 100, y: 100, width: 100, height: 100))
        view.backgroundColor = .red
        return view
    }
    
    private var button: UIButton = {
        let button = UIButton()
        button.setTitle("Flex", for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = .green
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        view.addSubview(cardView)
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 52),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGest))
        button.addGestureRecognizer(tap)
    }
    
    @objc func tapGest() {
        FLEXManager.shared.showExplorer()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == .motionShake {
            FLEXManager.shared.showExplorer()
        }
    }
}

