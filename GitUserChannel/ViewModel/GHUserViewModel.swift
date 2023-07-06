//
//  GHUserViewModel.swift
//  GitUserChannel
//
//  Created by Manish Parihar on 05.07.23.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}

class WebService: Codable {
    func downloadData<T: Codable>(fromURL: String) async -> T? {
        do {
            guard let url = URL(string: fromURL) else {throw NetworkError.badUrl}
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse }
            guard response.statusCode >= 200 && response.statusCode < 300 else { throw NetworkError.badStatus }
            guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else { throw NetworkError.failedToDecodeResponse }
            
            return decodedResponse
        }catch NetworkError.badUrl {
            print("There was an error creating the URL")
        } catch NetworkError.badResponse {
            print("Did not get a valid response")
        } catch NetworkError.badStatus {
            print("Did not get a 2xx status code from the response")
        } catch NetworkError.failedToDecodeResponse {
            print("Failed to decode response into the given type")
        } catch {
            print("An error occured downloading the data")
        }
        return nil
    }
}

// MainActor use - Swift knows this code will be run on the main thread
@MainActor class GHUserViewModel: ObservableObject {
    
    @Published var gitUserList : [GHUserList] = []
    //@Published var gitUserDetails : [GHUserDetail] = []
    
    func fetchUserLists() async {
        guard let downloadUserLists : [GHUserList] = await WebService().downloadData(fromURL: "https://api.github.com/users") else {return}
        gitUserList = downloadUserLists
    }

    
    /*
    // MARK: - API Call For User Details
    func fetchUserDetails(urlString: String, completion: @escaping (Result<GHUserDetail, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let userDetails = try decoder.decode(GHUserDetail.self, from: data)
                completion(.success(userDetails))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
     */

}
