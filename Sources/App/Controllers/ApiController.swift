//
//  File.swift
//  
//
//  Created by Dimitri SMITH on 06/01/2022.
//

import Fluent
import Vapor

struct ApiController {
    
    func index(req: Request) throws ->  EventLoopFuture<[SimpleArticle]> {
        return SimpleArticle.query(on: req.db).all()
    }
    
    
    
}
