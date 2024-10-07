//
//  Model.swift
//  ARBootCamp
//
//  Created by Arsalan Wahid Asghar on 10/6/24.
//

import SwiftUI
import RealityKit
import Combine

enum ModelCategory: CaseIterable {
    
    case space
    case energy
    case kitchen
    case shoes
    
    var label:String {
        get {
            switch self {
            case .space:
                return "space"
            case .energy:
                return "energy"
            case .kitchen:
                return "kitchen"
            case .shoes:
                return "shoes"
            }
        }
    }
}

class Model {
    
    var name:String
    var category: ModelCategory
    var thumbnail:Image
    var modelEntity:ModelEntity?
    /**
    Realitykit uses meter as units of measurement,but different models use other metric so we use
    this property to adjust scale for 3rd party assets
     */
    var scaleCompensation: Float
    
    init(name: String, category: ModelCategory, scaleCompensation: Float = 1) {
        self.name = name
        self.category = category
        self.thumbnail = Image(name) ?? Image(systemName: "heart")
        self.scaleCompensation = scaleCompensation
    }
    
    //TODO: Create a mehtod to async load modelEntity
    
}

struct Models {
    var all: [Model] = []
    
    init() {
        // spcae models
        let spaceSuit = Model(name: "spaceSuit", category: .space,scaleCompensation: 0.32/100)
        let hab = Model(name: "hab", category: .space,scaleCompensation: 0.32/100)
        let rover  = Model(name: "spaceSuit", category: .space,scaleCompensation: 0.32/100)
        
        self.all += [spaceSuit,hab,rover]
        
        let solarPanel  = Model(name: "solar_panels", category: .energy,scaleCompensation: 0.32/100)

        self.all += [solarPanel]
        
        let chair  = Model(name: "chair_swan", category: .kitchen,scaleCompensation: 0.32/100)
        
        let cup = Model(name: "cup_saucer_set", category: .kitchen,scaleCompensation: 0.32/100)
        
        let teaPot = Model(name: "teapot`", category: .kitchen, scaleCompensation: 0.32/100)
        
        self.all += [chair,cup,teaPot]
        
        let shoe1 = Model(name: "sneaker_airforce", category: .shoes,scaleCompensation: 0.32/100)
        
        let shoe2 = Model(name: "sneaker_pegasustrail", category: .shoes,scaleCompensation: 0.32/100)
        
        self.all += [shoe1,shoe2]
           
    }
    
    func get(category: ModelCategory) -> [Model] {
        return all.filter({ $0.category == category})
    }
    
}
