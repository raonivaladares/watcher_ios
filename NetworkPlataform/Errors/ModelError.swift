enum ModelError: Error {
    case jsonWithMissingKey(key: String)
    case jsonWithInvalidInput(key: String)
}
