//
//  AbstractErrorParser.swift
//  WeatherService
//
//  Created by Константин Шмондрик on 22.02.2026.
//


import Foundation

protocol AbstractErrorParser: Sendable {
    
    func parse(_ result: Error) -> Error
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
