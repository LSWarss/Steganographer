//
//  ImagePicker.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 02/06/2021.
//

import SwiftUI
import SwiftImage

struct ImagePicker : UIViewControllerRepresentable {
    
    class Coordinator : NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent : ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
//            if let imgUrl = info[.imageURL] as? URL {
//                print(imgUrl.lastPathComponent)
//
//
//                let inputPath = imgUrl.lastPathComponent
//                let inputImage = SwiftImage.Image<RGB<UInt8>>(contentsOfFile: inputPath)
//                let outputImage = try! encode(image: inputImage!, text: textData).uiImage
//
//                parent.image = outputImage
//            }
            
            if let uiImage = info[.originalImage] as? UIImage {
               
                let textData = "Test string"
                
                let image = SwiftImage.Image<RGB<UInt8>>(uiImage: uiImage)
                
                let outputImage = try! encode(image: image, text: textData)
                
                print(try! decode(image: outputImage))
                
                parent.image = outputImage.uiImage
            }
        }
        
    }

    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
}
