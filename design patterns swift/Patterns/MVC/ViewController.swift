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
        button.layer.cornerRadius = 12
        button.backgroundColor = .black
        button.setTitle("Flex", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to Zhokhas DS"
        label.font = .systemFont(ofSize: 28, weight: .medium)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let testAreaImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "testArea")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        addSubviews()
        setupLayout()
        addActions()
    }
    
    private func addSubviews() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(button)
        view.addSubview(testAreaImage)
    }
    
    private func setupLayout() {
        var layoutConstraints = [NSLayoutConstraint]()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ]
        
        testAreaImage.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            testAreaImage.heightAnchor.constraint(equalToConstant: view.frame.height/2),
            testAreaImage.widthAnchor.constraint(equalToConstant: view.frame.height/2),
            testAreaImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            testAreaImage.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ]
        
        button.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            button.heightAnchor.constraint(equalToConstant: 52),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ]
        
        NSLayoutConstraint.activate(layoutConstraints)
    }
    
    private func addActions() {
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
