
import Alamofire

class DemoAdapter: RequestAdapter {
      
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        //        urlRequest.setValue(MY_API_KEY, forHTTPHeaderField: "X-Mashape-Key")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")        
        return urlRequest
    }
}
