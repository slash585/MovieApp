//
//  DateConverter.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 24.08.2023.
//

import Foundation

class DateConverter {
    static let shared = DateConverter()
    
    private init() {}
    
    let inputDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    let outputDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        return formatter
    }()
    
    func convertDate(_ dateString: String) -> String? {
        if let inputDate = inputDateFormatter.date(from: dateString) {
            return outputDateFormatter.string(from: inputDate)
        }
        return nil
    }
}
