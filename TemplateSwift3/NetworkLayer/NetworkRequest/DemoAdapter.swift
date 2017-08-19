
import Alamofire

class DemoAdapter: RequestAdapter {
      
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.setValue(
            "application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type"
        )
        return urlRequest
    }
    
}
