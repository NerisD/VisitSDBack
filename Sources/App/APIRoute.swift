//
//  File.swift
//  
//
//  Created by Dimitri SMITH on 06/01/2022.
//

import Vapor

struct APIRoute: RouteCollection {
    
    let controller = ApiController()

    func boot(routes: RoutesBuilder) throws {
        let api = routes.grouped("api")
        api.get(use: controller.index)
//        api.post(use: create)
//        api.put(use: update)
//        api.group(":carsID") { car in
//            car.delete(use: delete)
//        }
        
        
    }
}
