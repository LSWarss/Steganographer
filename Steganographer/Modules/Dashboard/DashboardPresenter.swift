//
//  DashboardPresenter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 23/11/2021.
//

import Foundation

protocol DashboardPresenter {
    var router: DashboardRouter? { get set }
    var interactor: DashboardInteractor? { get set }
    var view: SteganographyDashboardView? { get set }

    func makeEncoding()
    func makeDecoding()
    func showHistory()
    func showInformation()

    func filter(with text: String)
}

final class DashboardPresenterImpl: DashboardPresenter {

    var router: DashboardRouter?

    var interactor: DashboardInteractor?

    var view: SteganographyDashboardView?

    func makeEncoding() {

        guard let view = view else { return }

        router?.pushToEncoding(on: view)
    }

    func makeDecoding() {

        guard let view = view else { return }

        router?.pushToDecoding(on: view)
    }

    func showHistory() {

        guard let view = view else { return }

        router?.pushToHistory(on: view)
    }

    func showInformation() {

        guard let view = view else { return }

        router?.pushToInfo(on: view)
    }

    func filter(with text: String) {

        guard let view = view else { return }

        view.filterCards(with: text)
    }

}
