//
//  SimpleArticleCOntroller.swift
//  
//
//  Created by Dimitri SMITH on 29/12/2021.
//

import Fluent
import Vapor

struct SimpleArticleController {
    
    func index(req: Request) throws -> EventLoopFuture<View> {
        return SimpleArticle.query(on: req.db).all()
            .flatMap { cars in
                return req.leaf.render("home", [
                    "title":"VisitSD",
                ])
            }
    }
    
    func addNewElement (req: Request) throws -> EventLoopFuture<View> {
        return req.leaf.render("addElement", [
            "title":"VisitSD - Ajoutez un nouvel élément",
        ])
    }
    
    func create(req: Request) throws -> EventLoopFuture<View> {
        var messageToDisplay = ""
        let article = try req.content.decode(SimpleArticle.self)
        let articleSaved = article.save(on: req.db)
        
        
        articleSaved.whenComplete { someResult in
            switch someResult {
            case .success:
                print("Success")
                messageToDisplay = "Success"
                
            case .failure(let error):
                print("Failure", error)
                messageToDisplay = "\(error)"
            }
        }
        
        return req.view.render("addElement", [
            "title":"VisitSD - Ajoutez un nouvel élément",
            "message":messageToDisplay, 
        ])
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return SimpleArticle.find(req.parameters.get("todoID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
