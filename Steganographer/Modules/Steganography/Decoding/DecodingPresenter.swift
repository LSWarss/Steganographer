//
//  DecodingPresenter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 23/11/2021.
//

import UIKit

protocol DecodingPresenter {
    var router: DecodingRouter? { get set }
    var interactor: DecodingInteractor? { get set }
    var view: SteganographyDecodingView? { get set }

    func interactorDidFinishDecoding(with result: Result<String, Error>)
}

final class DecodingPresenterImpl: DecodingPresenter {

    var router: DecodingRouter?

    var interactor: DecodingInteractor?

    var view: SteganographyDecodingView?

    func interactorDidFinishDecoding(with result: Result<String, Error>) {

    }

}
