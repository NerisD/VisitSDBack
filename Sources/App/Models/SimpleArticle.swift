//
//  SimpleArticle.swift
//  
//
//  Created by Dimitri SMITH on 29/12/2021.
//

import Foundation
import CoreLocation
import Fluent
import Vapor

final class SimpleArticle: Model, Content {
    static let schema = "simpleArticle"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String
    
    @Field(key: "category")
    var category: String
    
    @Field(key: "description")
    var description: String
    
    @Field(key: "decouverte")
    var decouverte: Bool
    
    @Field(key: "latitude")
    var latitude: String
    
    @Field(key: "longitude")
    var longitude: String
    
    @Field(key: "data")
    var data: Data
    
    @Timestamp(key: "createdAt", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updatedAt", on: .update)
    var updatedAt: Date?

    init() { }

    init(id: UUID? = nil, title: String,category: String ,description: String, decouverte: Bool, latitude: String,longitude: String ,data: Data, createdAt: Date? = nil, updatedAt: Date? = nil) {
        self.id = id
        self.title = title
        self.category = category
        self.description = description
        self.decouverte = decouverte
        self.latitude = latitude
        self.longitude = longitude
        self.data = data
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}


