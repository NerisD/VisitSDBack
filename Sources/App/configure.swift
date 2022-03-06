import Fluent
import FluentSQL
import FluentSQLiteDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    
    app.routes.defaultMaxBodySize = "5mb"
    
    // Configure DataBase
    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)
    
    app.migrations.add(CreateSimpleArticle())
    try app.autoMigrate().wait()
    

    
    // Not Using Cashing in development
    if !app.environment.isRelease {
        
        app.leaf.cache.isEnabled = false
    }

    
    let routers: [RouteCollection] = [
        FrontendRouter(),
        APIRoute(),
    ]
    for router in routers {
        
        try router.boot(routes: app.routes)
    }
    
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.views.use(.leaf)
}
