//
//  ContentView.swift
//  ARBootCamp
//
//  Created by Arsalan Wahid Asghar on 10/5/24.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    
    @State private var isControlVisible: Bool = true
    @State private var showBrowse: Bool = false

    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewController()
            
            ControlView(isControlVisible: $isControlVisible, showBrowse: $showBrowse)
        }.edgesIgnoringSafeArea(.all)
        
       
    }
 

}

struct ARViewController: UIViewRepresentable {
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> ARView {
            let arView = ARView(frame: .zero)
            return arView
        }
    }
    
#Preview {
    ContentView()
}
