//
//  Localisation.swift
//  
//
//  Created by Dimitri SMITH on 23/01/2022.
//

import Foundation
import CoreLocation
import Fluent
import Vapor

final class Localisation: Model, Content {
    static let schema = "localisation"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "longitude")
    var longitude: Double
    
    @Field(key: "latitude")
    var latitude: Double
    
    init() {}
    
    init(id: UUID? = nil, longitude: Double, latitude: Double) {
        
        
    }
    
    
    
    
    
    
}


