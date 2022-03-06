//
//  File.swift
//  
//
//  Created by Dimitri SMITH on 29/12/2021.
//

import Vapor

struct FrontendRouter: RouteCollection {
    
    let controller = SimpleArticleController()

    func boot(routes: RoutesBuilder) throws {
        routes.get(use: controller.index)
        routes.get("addElement", use: controller.addNewElement)
        routes.post("addElement", use: controller.create)
    }
}
