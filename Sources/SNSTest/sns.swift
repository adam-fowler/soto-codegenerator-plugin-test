import SotoCore

@main struct Run {
    static func main() async throws {
        let client = AWSClient(httpClientProvider: .createNew)
        let sns = SNS(client: client, region: .euwest1).with(middlewares: [AWSLoggingMiddleware()])
        let response = try await sns.createTopic(.init(name: "pluginTopic"))
        if let arn = response.topicArn {
            _ = try await sns.deleteTopic(.init(topicArn: arn))
        }
        try await client.shutdown()
    }
}
