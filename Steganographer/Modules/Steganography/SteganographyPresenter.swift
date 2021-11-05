//
//  SteganographyPresenter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 04/11/2021.
//

import Foundation
import UIKit

enum StegoError: Error {
    case failedEncoding
    case failedDecdoing
}

extension StegoError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .failedEncoding:
            return NSLocalizedString("Encountered error on encoding text in Image", comment: "Encoding Failure")
        case .failedDecdoing:
            return NSLocalizedString("Encountered error on decoding text from Image", comment: "Decoding Failure")
        }
    }
}

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }

    func showLoader()
    func dismissLoader()
    func interactorDidFinishEndcoding(with result: Result<UIImage, Error>)
    func interactorDidFinishDecoding(with result: Result<String, Error>)
}

final class SteganographyPresenter: AnyPresenter {

    var router: AnyRouter?

    var interactor: AnyInteractor?

    var view: AnyView?

    init(view: AnyView, interactor: AnyInteractor, router: AnyRouter) {
        self.router = router
        self.view = view
        self.interactor = interactor
    }

    func interactorDidFinishEndcoding(with result: Result<UIImage, Error>) {
        switch result {
        case .success(let image):
            view?.updateImage(with: image)
        case .failure(let error):
            view?.updateImage(with: error.localizedDescription)
        }
    }

    func interactorDidFinishDecoding(with result: Result<String, Error>) {
        switch result {
        case .success(let text):
            view?.updateText(with: text)
        case .failure(let error):
            view?.updateText(with: error.localizedDescription)
        }
    }

    func showLoader() {

    }

    func dismissLoader() {

    }
}
