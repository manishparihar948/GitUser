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
    @Published var gitUserDetails : [GHUserDetail] = []
    
    func fetchUserLists() async {
        guard let downloadUserLists : [GHUserList] = await WebService().downloadData(fromURL: "https://api.github.com/users") else {return}
        gitUserList = downloadUserLists
    }
    
    func fetchUserDetails(urlString:String) async {
        guard let downloadUserDetails : [GHUserDetail] = await WebService().downloadData(fromURL: urlString)  else {return}
        gitUserDetails = downloadUserDetails
    }

}
