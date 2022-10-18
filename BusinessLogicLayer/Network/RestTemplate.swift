import Foundation

class RestTemplate {
    
    private static let DEFAULT_CONTENT_TYPE = "application/json"
    private static let API_BASE_URL = "https://todolist.dev2.cogniteq.com/api/v1"
    static let INSTANCE = RestTemplate()
    
    private init() {}
    
    // MARK: - HTTP METHODS
    
        // DELETE WITHOUT BODY
    func delete<T: Decodable>(url: String, decodeTo: T.Type, completion: @escaping (_ responseData: T) -> Void) {
        load(method: Method.DELETE, urlString: url, body: nil as EmptyModel?, decodeTo: decodeTo, completion: completion)
    }
        // DELETE + BODY
    func delete<T: Decodable, E: Encodable>(url: String, body: E, decodeTo: T.Type, completion: @escaping (_ responseData: T) -> Void) {
        load(method: Method.DELETE, urlString: url, body: body, decodeTo: decodeTo, completion: completion)
    }
        // PUT
    func put<T: Decodable, E: Encodable>(url: String, body: E, decodeTo: T.Type, completion: @escaping (_ responseData: T) -> Void) {
        load(method: Method.PUT, urlString: url, body: body, decodeTo: decodeTo, completion: completion)
    }
        // GET
    func get<T: Decodable>(url: String, decodeTo: T.Type, completion: @escaping (_ responseData: T) -> Void) {
        load(method: Method.GET, urlString: url, body: nil as EmptyModel?, decodeTo: decodeTo, completion: completion)
    }
        // POST
    func post<T: Decodable, E: Encodable>(url: String, body: E, decodeTo: T.Type, completion: @escaping (_ responseData: T) -> Void) {
        load(method: Method.POST, urlString: url, body: body, decodeTo: decodeTo, completion: completion)
    }
    
    //MARK: - LOAD FUNCTION WITH DEFAULT HEADERS
    func load<T: Decodable, E: Encodable>(method: Method, urlString: String, body: E?,
                                          decodeTo: T.Type, completion: @escaping (_ responseData: T) -> Void) {
        let headers = [
            "Content-Type": RestTemplate.DEFAULT_CONTENT_TYPE,
            "Accept": RestTemplate.DEFAULT_CONTENT_TYPE
        ]
        return load(method: method, urlString: urlString, body: body, headers: headers, decodeTo: decodeTo, completion: completion)
    }
    
    // MARK: - LOAD FUNCTION WITH CUSTOM HEADERS
    func load<T: Decodable, E: Encodable>(method: Method, urlString: String, body: E?,
                                          headers: Dictionary<String, String>, decodeTo: T.Type,
                                          completion: @escaping (_ responseData: T) -> Void) {
        let url = URL(string: RestTemplate.API_BASE_URL + urlString)
        guard let url = url else {
            return
        }
        
        var request = URLRequest(url: url)
        
        if let body = body {
            let encoder = JSONEncoder()
            let data = try? encoder.encode(body)
            print(String(decoding: data!, as: UTF8.self))
            request.httpBody = data
        } else {
            print("\(method) \(urlString): empty body")
        }
        request.httpMethod = method.rawValue
        
        for header in headers {
            request.setValue(header.value, forHTTPHeaderField: header.key)
        }
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            if let error = error {
                print("Post Request Error: \(error.localizedDescription)")
                return
            }
            
            // ensure there is valid response code returned from this HTTP response
            guard let httpResponse = response as? HTTPURLResponse
            else {
                print("Invalid type of response. Expected HTTP 1.1 response")
                return
            }
            
            if (!(200...299).contains(httpResponse.statusCode)) {
                print("Invalid Response received from the server")
                guard let errorData = data else {
                    print("nil Data received from the server")
                    return
                }
                self?.decodeData(from: errorData, decodeTo: ErrorModel.self, completion: { errorInfo in
                    print("\(errorInfo.data.code): \(errorInfo.data.message)")
                })
                return
            }
            
            // ensure there is data returned
            guard let responseData = data else {
                print("nil Data received from the server")
                return
            }
            
            self?.decodeData(from: responseData, decodeTo: decodeTo, completion: completion)
        }
        // perform the task
        task.resume()
    }
    
    private func decodeData<T: Decodable>(from: Data, decodeTo: T.Type, completion: @escaping (T) -> Void) {
        let decoder = JSONDecoder()
        do {
            print(String(decoding: from, as: UTF8.self))
            let decodedData = try decoder.decode(decodeTo.self, from: from)
            completion(decodedData)
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
    }
    
    public enum Method: String {
        case GET = "GET"
        case POST = "POST"
        case PUT = "PUT"
        case DELETE = "DELETE"
    }
}
