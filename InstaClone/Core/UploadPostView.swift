//
//  UploadPostView.swift
//  InstaClone
//
//  Created by beri on 13.08.2026.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @Binding var tabIndex: Int
    
    // ViewModel'i buraya bağlıyoruz
    @StateObject private var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack {
            // action toolbar
            HStack {
                Button {
                    caption = ""
                    viewModel.selectedImage = nil
                    viewModel.postImage = nil
                    tabIndex = 0 
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding()
            
            // post ve açıklaması
            HStack {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                
                TextField("Enter your caption...", text: $caption, axis: .vertical)
            }
            .padding()
            
            Spacer()
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
