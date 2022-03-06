//
//  CreateSimpleArticle.swift
//  
//
//  Created by Dimitri SMITH on 29/12/2021.
//
import Foundation
import Fluent

struct CreateSimpleArticle: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("simpleArticle")
            .id()
            .field("title", .string, .required)
            .field("category", .string, .required)
            .field("description", .string, .required)
            .field("decouverte", .bool, .required)
            .field("longitude", .string, .required)
            .field("latitude", .string, .required)
            .field("data", .data, .required)
            .field("createdAt", .datetime, .required)
            .field("updatedAt", .datetime, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("simpleArticle").delete()
    }
}

