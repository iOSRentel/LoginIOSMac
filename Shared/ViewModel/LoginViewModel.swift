//
//  LoginViewModel.swift
//  LoginIOSMac (iOS)
//
//  Created by Boris Zinovyev on 28.10.2021.
//

import SwiftUI
import CryptoKit
import AuthenticationServices
import Firebase

class LoginViewModel: ObservableObject {
    
    @Published var nonce = ""

// Login properties
    @Published var userName = ""
    @Published var password = ""
    
// Register Properties
    @Published var gotoRegister = false
    
    @Published var registerUserName = ""
    @Published var registerPassword = ""
    @Published var reEnterPassword = ""
    
// LoadingScreen
    @Published var isLoading = false
    
// Error
    @Published var errorMsg = ""
    @Published var error = false
    
    //  Detectiong MacOS
    @Published var ismacOS = false

// Log status
    @AppStorage("log_Status") var status = false
    
//MARK: - Auth
    func loginUser(){
//   Loading Screen
        withAnimation{isLoading = true}
    
        
//MARK: Login User
        Auth.auth().signIn(withEmail: userName, password: password) { [self] (result, err) in
            if let error = err{
//   Promoting Error
                errorMsg = error.localizedDescription
                self.error.toggle()
                return
            }
            
            guard let _ = result else{
                errorMsg = "Please try again later"
                error.toggle()
                return
            }
            print("Success")
            withAnimation{status = true}
        }
    }
    
//MARK: Reset password
    func resetPassword() {

//Check password
            withAnimation{isLoading = true}
            
            Auth.auth().sendPasswordReset(withEmail: userName) { [self] (err) in
                if let error = err{
    //   Promoting Error
                    errorMsg = error.localizedDescription
                    self.error.toggle()
                    return
                }
                errorMsg = "Reset Link send successfully"
                error.toggle()
            }
        }
        
    //MARK: Regiser User
        func registerUser() {
            if reEnterPassword == registerPassword{
            
            withAnimation{isLoading = true}
                
            Auth.auth().createUser(withEmail: registerUserName, password: reEnterPassword) { [self] (result, err) in
                if let error = err{
    //   Promoting Error
                    errorMsg = error.localizedDescription
                    self.error.toggle()
                    return
                }
                
                guard let _ = result else {
                    errorMsg = "Please try again later"
                    error.toggle()
                    return
                }
    //   Success
                print("Success")
                errorMsg = "Account Crated Successfully"
                error.toggle()
                withAnimation{gotoRegister = false}
                
            }
        }
        else{
         errorMsg = "Missing password"
            error.toggle()
        }
            
    }
    
    init() {
        #if !os(iOS)
        self.ismacOS = true
        #endif
    }

    
    func authenticate(credential: ASAuthorizationAppleIDCredential){

// getting Token
    guard let token = credential.identityToken else{
      print("error with Firebase")

      return
    }
// Token string
    guard let tokenString = String(data: token, encoding: .utf8) else{
      print("error with Token")

      return
    }
    let firebaseCredential = OAuthProvider.credential(withProviderID: "apple.com" ,idToken: tokenString, rawNonce: nonce)

    Auth.auth().signIn(with: firebaseCredential) { (result, err) in

      if let error = err{
        print(error.localizedDescription)

        return
      }
// User Successfully Logged into Firebase
        print("Logged In Seccess")
        withAnimation(.easeInOut){
        self.status = true
            }
        }
    }
}

// hepers for Apple login with Firebase

func sha256(_ input: String) -> String {
  let inputData = Data(input.utf8)
  let hashedData = SHA256.hash(data: inputData)
  let hashString = hashedData.compactMap {
    String(format: "%02x", $0)
  }.joined()

  return hashString
}

func randomNonceString(length: Int = 32) -> String {
  precondition(length > 0)
  let charset: [Character] =
    Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
  var result = ""
  var remainingLength = length

  while remainingLength > 0 {
    let randoms: [UInt8] = (0 ..< 16).map { _ in
      var random: UInt8 = 0
      let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
      if errorCode != errSecSuccess {
        fatalError(
          "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
        )
      }
      return random
    }

    randoms.forEach { random in
      if remainingLength == 0 {
        return
      }

      if random < charset.count {
        result.append(charset[Int(random)])
        remainingLength -= 1
      }
    }
  }

  return result
}

   

