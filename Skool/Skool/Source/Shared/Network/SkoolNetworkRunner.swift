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
    let baseUrl = "https://open.neis.go.kr/hub"
    
    private let session: Session = {
        let configuration = URLSessionConfiguration.af.default
        let apiLogger = APIEventLogger()
        let session = Session(configuration: configuration, eventMonitors: [apiLogger])
        return session
    }()
    
    //MARK: Meal
    func mealRequest<Parameters: Encodable, Response: Decodable>(
        url: String,
        method: HTTPMethod,
        parameters: Parameters?,
        response: Response.Type = VoidResponse.self,
        completionHandler: @escaping (Result<Response, Error>) -> Void
    ) {
        
        session.request (
            baseUrl + url,
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
    
    
    //MARK: TimeTable
    func TimeTableRequest<Parameters: Encodable, Response: Decodable>(
        url: String,
        method: HTTPMethod,
        parameters: Parameters?,
        response: Response.Type = VoidResponse.self,
        completionHandler: @escaping (Result<Response, Error>) -> Void
    ) {
        
        var components = URLComponents(string: baseUrl + url)
        
        if let parameters = parameters as? [String: String] {
            let queryItems = [
                URLQueryItem(name: "KEY", value: parameters["KEY"]),
                URLQueryItem(name: "Type", value: parameters["Type"]),
                URLQueryItem(name: "ATPT_OFCDC_SC_CODE", value: parameters["ATPT_OFCDC_SC_CODE"]),
                URLQueryItem(name: "SD_SCHUL_CODE", value: parameters["SD_SCHUL_CODE"]),
                URLQueryItem(name: "ALL_TI_YMD", value: parameters["ALL_TI_YMD"]),
                URLQueryItem(name: "GRADE", value: parameters["GRADE"]),
                URLQueryItem(name: "CLASS_NM", value: parameters["CLASS_NM"])
            ]
            
            components?.queryItems = queryItems
        }
        
        guard let urlString = components?.url?.absoluteString else {
            completionHandler(.failure(NSError(domain: "InvalidURL", code: -1, userInfo: nil)))
            return
        }
        
        session.request(urlString, method: method)
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
