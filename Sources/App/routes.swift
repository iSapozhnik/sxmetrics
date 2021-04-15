import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    app.get("metrics") { req -> String in
        return "SXMetrics works"
    }
    
    try app.register(collection: TodoController())
    try app.register(collection: MetricsController())
}
