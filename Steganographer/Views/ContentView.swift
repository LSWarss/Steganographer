//
//  ContentView.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 29/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var image: Image?
    
    @State private var showingImagePicker = false
    @State private var inputImage : UIImage?
    
    var body: some View {
        ZStack {
            // All properties will be used on it only if not nil
            image?
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Button(action: {
                    self.showingImagePicker.toggle()
                }, label: {
                    HStack {
                        Image(systemName: "photo")
                            .font(.system(size: 20))
                        Text("Choose Photo")
                            .font(.headline)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
                })
            }.sheet(isPresented: $showingImagePicker) {
                PhotoPicker(isPresented: $showingImagePicker, selectedImage: $image)
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
