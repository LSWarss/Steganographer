//
//  PhotoPicker.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 29/05/2021.
//

import SwiftUI
import PhotosUI

struct PhotoPicker : UIViewControllerRepresentable {
    @Binding var isPresented : Bool
    @Binding var selectedImage : Image?
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        configuration.filter = .images
        
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator : PHPickerViewControllerDelegate{
        private let parent : PhotoPicker
        
        init(_ parent : PhotoPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            parent.isPresented = false
            if let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { [weak self] uiImage, error in
                    DispatchQueue.main.async {
                        guard let self = self, let uiImage = uiImage as? UIImage else {
                            return
                        }
                        
                        let string = "test"
                        print(string.stringToBinary())
                        
                        guard let cgImage = uiImage.cgImage, let data = cgImage.dataProvider?.data, let bytes = CFDataGetBytePtr(data) else {
                            fatalError("Couldn't access image data")
                        }
                        assert(cgImage.colorSpace?.model == .rgb)
                        
                        let bytesPerPixel = cgImage.bitsPerPixel / cgImage.bitsPerComponent
                        for y in 0 ..< cgImage.height {
                            for x in 0 ..< cgImage.width {
                                let offset = (y * cgImage.bytesPerRow) + (x * bytesPerPixel)
                                let components = (r: bytes[offset], g: bytes[offset + 1], b: bytes[offset + 2])
                                print("[x:\(x), y:\(y)] \(components)")
                            }
                            print("---")
                        }
                        
                        self.parent.selectedImage = Image(uiImage: uiImage)
                    }
                }
            }
        }
        
    }
    
}



