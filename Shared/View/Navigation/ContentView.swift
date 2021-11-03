//
//  ContentView.swift
//  Shared
//
//  Created by Boris Zinovyev on 28.10.2021.
//
import SwiftUI
import Firebase

struct ContentView: View {
    @AppStorage("log_Status") var status = false
    
    var body: some View {
        
        if status{
            DashboardView()
        }else{
            Home()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        Home()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
