//
//  NetworkLogger.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 22.02.2026.
//


import Foundation
import Alamofire

final class NetworkLogger: EventMonitor {

    let queue = DispatchQueue(label: "network.logger")

    // MARK: - REQUEST
    func request(
        _ request: Request,
        didCreateURLRequest urlRequest: URLRequest
    ) {
        print("➡️ REQUEST: \(urlRequest.httpMethod ?? "") \(urlRequest.url?.absoluteString ?? "")")

        if let headers = urlRequest.allHTTPHeaderFields, !headers.isEmpty {
            print("HEADERS:")
            headers.forEach { print("  \($0): \($1)") }
        }

        if let body = urlRequest.httpBody {
            logBody(body)
        }
    }

    // MARK: - RESPONSE
    func request<Value>(
        _ request: DataRequest,
        didParseResponse response: DataResponse<Value, AFError>
    ) {
        print("⬅️ RESPONSE: \(response.response?.statusCode ?? 0)")

        if let data = response.data {
            logBody(data)
        }

        if let error = response.error {
            print("❌ ERROR: \(error)")
        }
    }

    // MARK: - Helpers
    private func logBody(_ data: Data) {
        if let json = try? JSONSerialization.jsonObject(with: data),
           let pretty = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
           let string = String(data: pretty, encoding: .utf8) {
            print(string)
        } else if let string = String(data: data, encoding: .utf8) {
            print(string)
        }
    }
}