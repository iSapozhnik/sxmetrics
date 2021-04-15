import Fluent

struct CreateMetric: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("metrics")
            .id()
            .field("title", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("metrics").delete()
    }
}
