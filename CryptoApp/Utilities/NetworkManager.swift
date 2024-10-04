//
//  NetworkManager.swift
//  CryptoApp
//
//  Created by Aman Gupta on 27/05/24.
//

import Foundation
import Combine

class NetworkManager{
    
    enum NetworkingError: LocalizedError {
        case badUrlResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self{
            case .badUrlResponse(url: let url): return "[🔥] Bad Response from URL: \(url)"
            case .unknown: return "[⚠️] Unknown error occured"
            }
        }
        
    }
    
    static func download(url: URL) -> AnyPublisher<Data,Error>{
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos:.default))
            .tryMap( { try handleResponse(output: $0)})
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
    static func handleResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data{
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else{
            throw URLError(.badServerResponse)
        }
        
        return output.data
        
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>){
        switch completion{
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
}
