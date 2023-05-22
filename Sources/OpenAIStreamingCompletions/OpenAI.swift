import Foundation

public struct OpenAIAPI {
    var apiKey: String
    var orgId: String?
    var textCompletionEndPoint = "https://api.openai.com/v1/chat/completions"
    var chatCompletionEndPoint = "https://api.openai.com/v1/completions"

    public init(apiKey: String, orgId: String? = nil, origin: String? = nil) {
        self.apiKey = apiKey
        self.orgId = orgId
        if let origin = origin {
            self.origin = origin
        }
    }
}

extension OpenAIAPI {
    enum Errors: Error {
        case noChoices
        case invalidResponse(String)
        case noApiKey
    }
}

