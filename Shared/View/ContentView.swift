//
//  ContentView1.swift
//  Shared
//
//  Created by Boris Zinovyev on 28.10.2021.
//
import SwiftUI
import Firebase

struct ContentView: View {
    @State private var currentList = 0

    @AppStorage("log_Status") var status = false
    
    var body: some View {
    
        if status{
            DashboardView()
        }else{
            Welcome()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
