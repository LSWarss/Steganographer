//
//  HomePresenter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol HomePresenter: BasePresenter {
    func presentHome()
}

final class HomePresenterImpl<T: HomePresentable>: BasePresenterImpl<T> { }

extension HomePresenterImpl: HomePresenter {

    func presentHome() {
        controller?.displayHome()
    }
}

private extension HomePresenterImpl {}
