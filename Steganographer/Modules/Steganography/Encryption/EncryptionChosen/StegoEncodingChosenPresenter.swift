//
//  StegoEncodingChosenPresenter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/01/2022.
//  Copyright (c) 2022. All rights reserved.

import UIKit

protocol StegoEncodingChosenPresenter: BasePresenter {
    func presentStegoEncodingChosen(with image: UIImage)
    func presentImageSavingForImage(_ image: UIImage)
}

final class StegoEncodingChosenPresenterImpl<T: StegoEncodingChosenPresentable>: BasePresenterImpl<T> { }

extension StegoEncodingChosenPresenterImpl: StegoEncodingChosenPresenter {

    func presentStegoEncodingChosen(with image: UIImage) {
        controller?.displayStegoEncodingChosen(with: image)
    }
    
    func presentImageSavingForImage(_ image: UIImage) {
        let url = try? exportImageAsPNG(image, filename: "image_enc_\(Int.random(in: 1..<99999))")
        guard let url = url else { return }
        controller?.displayImageSaving(for: url)
    }
}

private extension StegoEncodingChosenPresenterImpl {
    
    private func exportImageAsPNG(_ image: UIImage, filename: String) throws -> URL? {
        guard let pngData = image.pngData() else {
            return nil
        }
        let temporaryURL = FileManager.default.temporaryDirectory
            .appendingPathComponent(filename)
            .appendingPathExtension("png")
        try pngData.write(to: temporaryURL, options: [])
        return temporaryURL
    }
    
}
