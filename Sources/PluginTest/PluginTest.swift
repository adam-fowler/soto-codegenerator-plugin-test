import SotoCore
import SotoS3

@main struct Run {
    static func main() async throws {
        let client = AWSClient(httpClientProvider: .createNew)
        let s3 = S3(client: client, region: .euwest1).with(middlewares: [AWSLoggingMiddleware()])
        let response = try await s3.listBuckets()
        print(response)
        try await client.shutdown()
    }
}
