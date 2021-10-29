//
//  ViewController.swift
//  BananaFinderTestProgect
//
//  Created by Dima Biliy on 29.10.2021.
//

import UIKit

final class MainViewController: UIViewController {
    
    var presenter : MainPresenter!
    
    private let label : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Press button to get bananas count"
        label.textAlignment = .center
        return label
    }()
    
    private let button : UIButton = {
       let button = UIButton()
        button.setTitle("Get", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        label.frame = CGRect(x: view.frame.width/2 - 150, y: 100, width: 300, height: 100)
        view.addSubview(label)
        
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        button.center = view.center
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonSelector), for: .touchUpInside)
    }

    @objc func buttonSelector() {
        presenter.tapButton()
    }

}

extension MainViewController : MainViewProtocol {
    func sendbananaNumber(_ bananaNumber: String) {
        label.text = bananaNumber
    }
}


