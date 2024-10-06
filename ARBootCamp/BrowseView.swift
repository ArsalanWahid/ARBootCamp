//
//  BrowseView.swift
//  ARBootCamp
//
//  Created by Arsalan Wahid Asghar on 10/6/24.
//

import SwiftUI


struct BrowseView: View {
    
    @Binding var showBrowse: Bool
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                
            }.navigationTitle("Browse")
                .navigationBarItems(trailing: Button(action: {
                    self.showBrowse.toggle()
                }){
                    Text("Done").bold()
                })
        }
    }
}
