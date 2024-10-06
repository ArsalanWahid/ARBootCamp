//
//  ControlView.swift
//  ARBootCamp
//
//  Created by Arsalan Wahid Asghar on 10/6/24.
//

import SwiftUI

struct ControlView: View {
    @Binding var isControlVisible: Bool
    @Binding var showBrowse: Bool

    
    var body: some View {
        VStack {
            ControlVisibliityToggleButton(isControlVisible: $isControlVisible)
            Spacer()
            
            if(isControlVisible) {
                ControlButtonBar(showBrowse: $showBrowse)
            }
        }
    }
}

struct ControlVisibliityToggleButton : View {
    
    //references state property somewhere else
    @Binding var isControlVisible: Bool
    var body: some View {
        HStack {
            Spacer()
            ZStack {
                Color.black.opacity(0.25)
                Button(action: {
                    self.isControlVisible.toggle()
                }) {
                    Image(systemName: self.isControlVisible ? "rectangle" : "slider.horizontal.below.rectangle").font(.system(size: 25)).foregroundStyle(.white).buttonStyle(PlainButtonStyle())
                }
            }.frame(width: 50, height: 50).cornerRadius(20)
        }.padding(.top,45)
         .padding(.trailing, 20)
    }
}

struct ControlButtonBar : View {
    
    @Binding var showBrowse: Bool

    
    var body: some View {
        HStack {
            controlButton(systemIconName: "clock.fill") {}
        
            Spacer()
            
            controlButton(systemIconName: "square.grid.2x2") {
                self.showBrowse.toggle()
            }.sheet(isPresented: $showBrowse, content: {
                BrowseView(showBrowse: $showBrowse)
            })
            
            Spacer()
            
            controlButton(systemIconName: "slider.horizontal.3") {}
            
        }.frame(maxWidth: 500).padding(30).background(Color.black.opacity(0.3)   )
    }
}

struct controlButton: View {
    
    let systemIconName:String
    let action: () -> Void
    
    var body: some View {
        Button(action: {self.action()}) {
            Image(systemName: systemIconName).font(.system(size: 35)).foregroundColor(.white).frame(width: 50, height: 50)
        }
    }
}
