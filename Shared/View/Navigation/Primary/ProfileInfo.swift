//
//  ProfileInfo.swift
//  LoginIOSMac
//
//  Created by Boris Zinovyev on 15.11.2021.
//

import SwiftUI

struct ProfileInfo: View {
    
    @State private var profileImage: Image?
    @State private var pickedImage: Image?
    @State private var showingActionSheet = false
    @State private var showingImagePicker = false
    @State private var imageData: Data = Data()
    @State private var soueceType: UIImagePickerController.SourceType = .photoLibrary
    
    func loadImage() {
        guard let inputImage = pickedImage else {return}
            profileImage = inputImage
    }
    
    var body: some View {
        
        HStack {
            if profileImage != nil {
                profileImage!.resizable()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        self.showingActionSheet = true
                    }
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        self.showingActionSheet = true
                    }
            }
            

            VStack(alignment: .leading) {
                Text("Business name")
                    .font(.system(size: 17, weight: .medium, design: .default))
                Text("Your profile settings, and more")
                    .font(.system(size: 12, weight: .regular, design: .default))
                    .foregroundColor(.gray)
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(pickedImage: self.$pickedImage, showImagePicker: self.$showingImagePicker, imageData: self.$imageData)
        }
        .actionSheet(isPresented: $showingActionSheet) {
            ActionSheet(title: Text(""), buttons: [
                .default(Text("Choose your account Logo")) {
                    self.soueceType = .photoLibrary
                    self.showingImagePicker = true
//                },
//                .default(Text("Take a Photo")) {
//                    self.soueceType = .camera
//                    self.showingImagePicker = true
                },
                .cancel()
            ])
        }
    }
}

