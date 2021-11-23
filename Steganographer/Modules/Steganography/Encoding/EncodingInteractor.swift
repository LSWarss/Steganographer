//
//  SteganographyInteractor.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 04/11/2021.
//

import Foundation
import DisguisedSwiftly
import UIKit

protocol EncodingInteractor {
    var presenter: EncodingPresenter? { get set }
    var stego: Stego? { get set }
    func encodeWithText(with text: String, in image: UIImage)
    func decodeFromImage(from image: UIImage)
}

final class EncodingInteractorImpl: EncodingInteractor {

    var presenter: EncodingPresenter?

    var stego: Stego?

    func encodeWithText(with text: String, in image: UIImage) {
//        presenter?.showLoader()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            let image = self.stego?.encodeTextInImage(with: text, image: image, progress: { [weak self] progress in
                switch progress {
                case .ended:
                    break
//                    self?.presenter?.dismissLoader()
                case .working:
                    print("Encoding")
                case .failed:
                    break
//                    self?.presenter?.dismissLoader()
                }

            })

            guard let image = image else { return }

            self.presenter?.interactorDidFinishEndcoding(with: .success(image))
        }
    }

    func decodeFromImage(from image: UIImage) {
//        presenter?.showLoader()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            let decodedText = self.stego?.decodeTextInImage(image: image, progress: { [weak self] progress in
                switch progress {
                case .ended:
                    break
//                    self?.presenter?.dismissLoader()
                case .working:
                    print("Decoding")
                case .failed:
                    break
//                    self?.presenter?.dismissLoader()
                }
            })

            guard let decodedText = decodedText else { return }

            self.presenter?.interactorDidFinishDecoding(with: .success(decodedText))

        }
    }

}
