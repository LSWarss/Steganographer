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
    @Binding var selectedImage : UIImage?
    @Binding var message : String
    @Binding var visibleImage : SwiftUI.Image?
    var option : Options
    
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
                    
                    if self!.parent.option == .encoding {
                        DispatchQueue.main.async {
                            guard let self = self, let uiImage = uiImage as? UIImage else {
                                return
                            }
                            
                            let image = SwiftImage.Image<RGB<UInt8>>(uiImage: uiImage)
                            let outputImage = try! encode(image: image, text: self.parent.message)
                            print(try! decode(image: outputImage))
                            
                            self.parent.selectedImage = outputImage.uiImage
                            self.parent.visibleImage = SwiftUI.Image(uiImage: outputImage.uiImage)
                            
                        }
                    } else {
                        DispatchQueue.main.async {
                            guard let self = self, let uiImage = uiImage as? UIImage else {
                                return
                            }
                            
                            let image = SwiftImage.Image<RGB<UInt8>>(uiImage: uiImage)
                            print(try! decode(image: image))
                            
                            self.parent.message = try! decode(image: image)
                            
                            self.parent.selectedImage = uiImage
                            self.parent.visibleImage = SwiftUI.Image(uiImage: uiImage)
                            
                        }
                    }
                }
            }
        }
        
    }
    
}


class ImageSaver : NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error : Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
}

