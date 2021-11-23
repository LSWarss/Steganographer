//
//  DecodingInteractor.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 23/11/2021.
//

import UIKit
import DisguisedSwiftly

protocol DecodingInteractor {
    var presenter: DecodingPresenter? { get set }
    var stego: Stego? { get set }
    func decodeFromImage(from image: UIImage)
}

final class DecodingInteractorImpl: DecodingInteractor {

    var presenter: DecodingPresenter?

    var stego: Stego?

    func decodeFromImage(from image: UIImage) {

    }

}
