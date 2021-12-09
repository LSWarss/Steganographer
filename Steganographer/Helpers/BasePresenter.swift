//
//  BasePresenter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 09/12/2021.
//

import UIKit

protocol BasePresenter {

}

class BasePresenterImpl<T: BasePresentable>: BasePresenter {

    weak var controller: T?

}
