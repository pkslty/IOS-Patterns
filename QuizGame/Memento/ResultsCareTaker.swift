//
//  RecordsCareTaker.swift
//  QuizGame
//
//  Created by Denis Kuzmin on 12.08.2021.
//

import Foundation

final class ResultsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "QuizResults"
    
    func saveResults(results: [Result]) {
        do {
            let data = try self.encoder.encode(results)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func loadResults() -> [Result] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([Result].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
