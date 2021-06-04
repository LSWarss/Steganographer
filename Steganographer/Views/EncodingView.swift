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
    @State private var message : String = "Message"
    
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
                ZStack {
                Rectangle()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .foregroundColor(.purple)
                    .cornerRadius(10)
                    .padding()
                TextField("Enter message to hide:", text: $message)
                    .padding(.horizontal, 30.0)
                    .font(.headline)
                    .foregroundColor(.white)
                    
                }
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
            }.sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                PhotoPicker(isPresented: $showingImagePicker, selectedImage: $image, message: $message)
            }
            .padding()
        }
    }
    
    func loadImage() {
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
