//
//  ViewController.swift
//  design patterns swift
//
//  Created by Жахaнгир Таиров on 02.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var cardView: UIView {
        let view = UIView(frame: .init(x: 100, y: 100, width: 100, height: 100))
        view.backgroundColor = .red
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        view.addSubview(cardView)
    }
}

