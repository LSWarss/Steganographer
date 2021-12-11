//
//  HomePresenter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol HomePresenter: BasePresenter {
    // TODO: Fill this with public interactor methods
    func presentHome()
}

final class HomePresenterImpl<T: HomePresentable>: BasePresenterImpl<T> { }

extension HomePresenterImpl: HomePresenter {

    // TODO: Fill this with public interactor methods
    func presentHome() {
        controller?.displayHome()
    }
}

private extension HomePresenterImpl {
    // TODO: Fill this with private interactor methods
}
