//
//  NetworkManager.swift
//  watch-weather-app WatchKit Extension
//
//  Created by Rick Brown on 06/03/2021.
//
import Foundation

enum NetworkError: Error {
  case badResponse
  case wrongStatusCode(code: Int)
  case error(err: String)
  case decodingError(err: String)
  case emptyData
}

final class NetworkManager<T: Codable> {
  func fetch(for url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      // Check that 'error' is nil, otherwise just handle the error with the completion callback
      guard error == nil else {
        completion(.failure(.error(err: error!.localizedDescription)))
        return
      }
      // check for the 'response', handling the error as before
      // if present, the response is casted to an HTTPURLResponse so then we can check for the statusCode
      guard let httpResponse = response as? HTTPURLResponse else {
        completion(.failure(.badResponse))
        return
      }
      // check that the returned status code is 200, otherwise there has been a server error. Handle as before
      guard httpResponse.statusCode == 200 else {
        completion(.failure(.wrongStatusCode(code: httpResponse.statusCode)))
        return
      }
      // check the data exists, handle any errors as before
      guard let data = data else {
        completion(.failure(.emptyData))
        return
      }
      
      do {
        let json = try JSONDecoder().decode(T.self, from: data)
        // URLSession (which is asynchronous) is always called in a background thread to prevnt UI blocking
        // bring now to the 'main' queue
        DispatchQueue.main.async {
          completion(.success(json))
        }
      } catch let err {
        completion(.failure(.decodingError(err: err.localizedDescription)))
      }
    }.resume()
  }
}
