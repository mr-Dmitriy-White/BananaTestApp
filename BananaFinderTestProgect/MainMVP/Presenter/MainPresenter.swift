//
//  MainPresenter.swift
//  BananaFinderTestProgect
//
//  Created by Dima Biliy on 29.10.2021.
//

import Foundation

protocol MainViewProtocol : AnyObject {
    func sendbananaNumber(_ bananaNumber: String)
}

protocol MainPresenterProtocol: AnyObject {
    func tapButton()
    init(mainView : MainViewProtocol,
         networking : NetworkServiceProtocol)
}

class MainPresenter : MainPresenterProtocol{
    
    let networking : NetworkServiceProtocol!
    let mainView: MainViewProtocol!

    required init(mainView: MainViewProtocol,
                  networking: NetworkServiceProtocol) {
        self.networking = networking
        self.mainView = mainView
    }
    
    func tapButton(){
        networking.getBananaWiki { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let result):
                    guard let result = result else {return}
                    self.mainView.sendbananaNumber(String(describing: result))
                case .failure(let error) :
                    print("Alert with error", error.localizedDescription)
                }
            }
        }
    }
    
}

