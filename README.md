# OpenAIStreamingCompletions

Streaming text generartion using the OpenAI APIs.

Supports streaming results via `ObservableObject` or `AsyncStream`, and non-streaming results via `async/await`.

Supports message-based models (e.g. ChatGPT) and text-based models (e.g. davinci).

## Installation via Swift Package Manager

You can either:
- Add this line to your `Package.swift` `dependencies` array: `.package(url: "https://github.com/nate-parrott/openai-streaming-completions-swift", from: "1.0.1")`
- Use Xcode's `File -> Add Packages` and paste the URL to this repository

## Calling ChatGPT

### Provide API key and prompt

```swift
let messages: [OpenAIAPI.Message] = [
    .init(role: .system, content: "You are a helpful assistant. Answer in one sentence if possible."),
    .init(role: .user, content: prompt)
]
let api = OpenAIAPI(apiKey: key)
```

### Customize the endpoint
```swift
api.textCompletionEndPoint = "https://api.openai.com/v1/chat/completions" // default to OpenAI
api.chatCompletionEndPoint = "https://api.openai.com/v1/completions" // default to OpenAI
```

### Option A: Generate text (streaming, asyncStream)

```
Task {
    let stream =  try api.completeChatStreaming(.init(messages:  promptMessages))
    for await message in stream {
        print("\(message.content)") // each message contains a small part of the response
    }
}

```


### Option B: Generate text (non-streaming, async/await)

```swift
Task {
    do {
        self.completedText = try await api.completeChat(.init(messages: messages))
    } catch {
        print("Error: \(error)")
    }
}
```

## Calling other text APIs

See [OpenAIAPI+TextCompletion.swift](https://github.com/nate-parrott/openai-streaming-completions-swift/blob/main/Sources/OpenAIStreamingCompletions/OpenAI%2BTextCompletion.swift)
