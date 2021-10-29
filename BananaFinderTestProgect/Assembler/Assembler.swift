//
//  Assembler.swift
//  BananaFinderTestProgect
//
//  Created by Dima Biliy on 29.10.2021.
//

import Foundation
import UIKit

protocol AssemblerProtocol: AnyObject {
    func configureMVP() -> UIViewController
}

class Assembler: AssemblerProtocol {
    func configureMVP() -> UIViewController {
        let networkService = NetworkService()
        let view = MainViewController()
        let presenter = MainPresenter(mainView: view, networking: networkService)
        view.presenter = presenter
        return view
    }
}
