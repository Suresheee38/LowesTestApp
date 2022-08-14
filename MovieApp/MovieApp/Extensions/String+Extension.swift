//
//  String+Extension.swift
//  MovieApp
//
//  Created by Suresh kumar Vijayakumar on 8/14/22.
//

import Foundation

extension String {
    
    func getFormattedDate() -> String? {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMMM d, yyyy"

        guard let date = dateFormatterGet.date(from: self) else {
            return nil
        }
        return dateFormatterPrint.string(from: date)
    }
}
