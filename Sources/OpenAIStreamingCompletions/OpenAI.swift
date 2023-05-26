import Foundation

public struct OpenAIAPI {
    var apiKey: String
    var orgId: String?
    var textCompletionEndPoint = "https://api.openai.com/v1/chat/completions"
    var chatCompletionEndPoint = "https://api.openai.com/v1/completions"

    public init(apiKey: String, orgId: String? = nil, chatAPI: String? = nil, textAPI: String? = nil) {
        self.apiKey = apiKey
        self.orgId = orgId
        
        if let c = chatAPI {
            chatCompletionEndPoint = c
        }
        
        if let t = textAPI {
            textCompletionEndPoint = t
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

