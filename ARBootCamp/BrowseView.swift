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
                HorizaontalGrid()
            }.navigationTitle("Browse")
                .navigationBarItems(trailing: Button(action: {
                    self.showBrowse.toggle()
                }){
                    Text("Done").bold()
                })
        }
    }
}

struct HorizaontalGrid:View {
    private let gridItemLayout = [GridItem(.fixed(150))]
    
    var body: some View {
        VStack(alignment:.leading) {
            Text("category Title")
                .font(.title2).bold()
                .padding(.leading,20)
                .padding(.top,10)
            ScrollView {
                LazyHGrid(rows: gridItemLayout, spacing: 30) {
                    ForEach(0..<5) { index in
                        Color(UIColor.secondarySystemFill)
                            .frame(width: 150,height: 150).cornerRadius(8)
                        
                    }
                }.padding(.horizontal,22)
                    .padding(.vertical,10)
            }
            
            
        }
    }
    
    
}
