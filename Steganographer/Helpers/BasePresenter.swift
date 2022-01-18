//
//  BasePresenter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 09/12/2021.
//

import UIKit

protocol BasePresenter {
    func presentError(_ error: Error)
}

class BasePresenterImpl<T: BasePresentable>: BasePresenter {

    weak var controller: T?
    
    func presentError(_ error: Error){
        log(.error, .bug, error.localizedDescription)
    }

}
