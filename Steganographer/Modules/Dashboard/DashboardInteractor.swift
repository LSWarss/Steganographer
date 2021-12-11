//
//  DashboardInteractor.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 23/11/2021.
//

import Foundation

protocol DashboardInteractor {
    var presenter: DashboardPresenter? { get set }
}

final class DashboardInteractorImpl: DashboardInteractor {

    var presenter: DashboardPresenter?

}
