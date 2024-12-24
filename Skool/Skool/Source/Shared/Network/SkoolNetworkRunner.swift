//
//  SkoolNetworkRunner.swift
//  Skool
//
//  Created by dgsw30 on 12/24/24.
//

import Foundation
import Alamofire

struct VoidResponse: Decodable {}

struct SkoolNetworkRunner {
    static let shared = SkoolNetworkRunner()
    let baseUrl = "https://open.neis.go.kr/hub/mealServiceDietInfo/"
    
    private let session: Session = {
        let configuration = URLSessionConfiguration.af.default
        let apiLogger = APIEventLogger()
        let session = Session(configuration: configuration, eventMonitors: [apiLogger])
        return session
    }()
    
    func request<Parameters: Encodable, Response: Decodable>(
        method: HTTPMethod,
        parameters: Parameters?,
        response: Response.Type = VoidResponse.self,
        completionHandler: @escaping (Result<Response, Error>) -> Void
    ) {
        
        session.request (
            baseUrl,
            method: method,
            parameters: parameters,
            encoder: URLEncodedFormParameterEncoder.default
        )
        .validate()
        .responseDecodable(of: response) { response in
            switch response.result {
            case .success(let value):
                completionHandler(.success(value))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
