//
//  DocumentPicker.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/01/2022.
//

import UIKit
import UniformTypeIdentifiers

public protocol FilesImagePickerDelegate: AnyObject {
    func didSelect(documentOnURL: URL?)
}

open class FilesImagePicker: NSObject, UIDocumentPickerDelegate {

    private let pickerController: UIDocumentPickerViewController
    private weak var presentationController: UIViewController?
    private weak var delegate: FilesImagePickerDelegate?

    public init(presentationController: UIViewController, delegate: FilesImagePickerDelegate) {
        self.pickerController = UIDocumentPickerViewController(documentTypes: [UTType.image.identifier], in: .import)

        super.init()

        self.presentationController = presentationController
        self.delegate = delegate

        self.pickerController.delegate = self
        self.pickerController.allowsMultipleSelection = false
    }
    
    public func present(from sourceView: UIView) {
        self.presentationController?.present(self.pickerController, animated: true)
    }

    private func pickerController(_ controller: UIDocumentPickerViewController, didSelect documentOnUrl: URL?) {
        controller.dismiss(animated: true, completion: nil)

        delegate?.didSelect(documentOnURL: documentOnUrl)
    }

    public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        self.pickerController(controller, didSelect: nil)
    }

    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        self.pickerController(controller, didSelect: urls.first)
    }
}
