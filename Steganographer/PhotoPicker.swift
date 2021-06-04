//
//  PhotoPicker.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 29/05/2021.
//

import SwiftUI
import PhotosUI
import SwiftImage

struct PhotoPicker : UIViewControllerRepresentable {
    @Binding var isPresented : Bool
    @Binding var selectedImage : SwiftUI.Image?
    
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
                            
                        let textData = "Test string"
                        let image = SwiftImage.Image<RGB<UInt8>>(uiImage: uiImage)
                        let outputImage = try! encode(image: image, text: textData)
                        print(try! decode(image: outputImage))
                        
                        self.parent.selectedImage = Image(uiImage: image.uiImage)
                    }
                }
            }
        }
        
    }
    
}




