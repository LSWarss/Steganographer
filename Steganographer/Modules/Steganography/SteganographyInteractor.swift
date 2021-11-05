//
//  SteganographyInteractor.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 04/11/2021.
//

import Foundation
import DisguisedSwiftly
import UIKit

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    var stego: Stego? { get set }
    func encodeWithText(with text: String, in image: UIImage)
    func decodeFromImage(from image: UIImage)
}

final class SteganographyInteractor: AnyInteractor {

    var presenter: AnyPresenter?

    internal var stego: Stego?

    init(stego: Stego) {
        self.stego = stego
    }

    func encodeWithText(with text: String, in image: UIImage) {
        presenter?.showLoader()
        let image = stego?.encodeTextInImage(with: text, image: image, finished: { finished in
            finished ? print("Ended encoding") : print("Didnt finish")
            presenter?.dismissLoader()
        })

        guard let image = image else { return }

        self.presenter?.interactorDidFinishEndcoding(with: .success(image))
    }

    func decodeFromImage(from image: UIImage) {
        presenter?.showLoader()
        let decodedText = stego?.decodeTextInImage(image: image, finished: { finished in
            finished ? print("Ended encoding") : print("Didnt finish")
            presenter?.dismissLoader()
        })

        guard let decodedText = decodedText else { return }

        self.presenter?.interactorDidFinishDecoding(with: .success(decodedText))
    }

}
