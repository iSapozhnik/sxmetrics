import Fluent
import Vapor

struct MetricsController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let metrics = routes.grouped("metrics")
        metrics.post(use: create)
    }
    
    func create(req: Request) throws -> EventLoopFuture<Metric> {
        let metric = try req.content.decode(Metric.self)
        print(metric.title)
        return metric.save(on: req.db).map { metric }
    }
}
