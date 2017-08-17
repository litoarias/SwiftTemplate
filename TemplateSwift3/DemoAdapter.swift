
import Alamofire

class DemoAdapter: RequestAdapter {
  
    private var nifVendedor: String = ""
    private var role: String = ""
    
    
    init(nifVendedor: String, role: String) {
        self.nifVendedor = nifVendedor
        self.role = role
    }
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        
        urlRequest.setValue(
            self.nifVendedor, forHTTPHeaderField: "nifvendedor"
        )
        
        urlRequest.setValue(
            self.role, forHTTPHeaderField: "role"
        )

        return urlRequest
    }
}
