//
//  String+.swift
//  Superhero
//
//  Created by Francis Adelante on 2/5/25.
//

import UIKit

extension String{
    
    func capitalizingFirstLetter() -> String {
        let first = String(self.prefix(1)).capitalized
        let other = String(self.dropFirst())
        return first + other
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func formatDateForDisplay(dateFormat: String = "MM-dd-yyyy") -> String? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatterGet.locale = Locale(identifier: "en_PH")
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = dateFormat
        dateFormatterPrint.locale = Locale(identifier: "en_PH")
        if self == "" {
            let date = Date()
            return dateFormatterPrint.string(from: date)
        } else {
            let date = dateFormatterGet.date(from: self)
            
            return dateFormatterPrint.string(from: date!)
        }
    }
    
    func getDateDiff(fromDateFormat: String = "MM-dd-yyyy HH:mm:ss") -> Int  {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = fromDateFormat
        dateFormatterGet.locale = Locale(identifier: "en_PH")
        let start = dateFormatterGet.date(from: self)!
        
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([Calendar.Component.minute], from: start, to: Date())
        
        let minute = dateComponents.minute
        return Int(minute!)
    }
    
    func currencyFormat(currencySymbol: String = "") -> String {
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.currencySymbol = currencySymbol
            formatter.locale = Locale(identifier: "fil_PH")
            formatter.maximumFractionDigits = 2
            if let str = formatter.string(for: value) {
                return str
            }
        }
        return ""
    }
    
    var maskEmail: String {
        let email = self
        let components = email.components(separatedBy: "@")
        var maskEmail = ""
        var maskFirst = ""
        if let first = components.first {
            maskFirst = String(first.enumerated().map { index, char in
                return [0, first.count - 1, first.count - 1].contains(index) ?
                char : "*"
            })
        }
        var maskLast = ""
        let componentsLast = components.last!.components(separatedBy: ".")
        if let last = componentsLast.first {
            maskLast = String(last.enumerated().map { index, char in
                return [0, last.count - 1, last.count - 1].contains(index) ?
                char : "*"
            })
        }
        
        maskEmail = maskFirst + "@" + maskLast + "." + (componentsLast.last ?? "")
        
        return maskEmail
    }
    
    func camelCaseToWords() -> String {
        return unicodeScalars.dropFirst().reduce(String(prefix(1))) {
            return CharacterSet.uppercaseLetters.contains($1)
            ? $0 + " " + String($1)
            : $0 + String($1)
        }
    }

    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    func cleanWhiteSpace() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
    
    var containsValidCharacter: Bool {
        guard self != "" else { return true }
        let noNeedToRestrict = CharacterSet(charactersIn: " -.") // NOT RESTRICT "Underscore and Space"
        if noNeedToRestrict.containsUnicodeScalars(of: self.last!) {
            return true
        } else {
            return CharacterSet.alphanumerics.containsUnicodeScalars(of: self.last!)
        }
    }
    
    var strippedSpecialCharacters: String {
        let okayChars = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-=().!_")
        return self.filter {okayChars.contains($0) }
    }
    
    func getCleanedURL() -> URL? {
        guard self.isEmpty == false else {
            return nil
        }
        if let url = URL(string: self) {
            return url
        } else {
            if let urlEscapedString = self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) , let escapedURL = URL(string: urlEscapedString){
                return escapedURL
            }
        }
        return nil
    }
  
}

extension CharacterSet {
    func containsUnicodeScalars(of character: Character) -> Bool {
        return character.unicodeScalars.allSatisfy(contains(_:))
    }
}

extension StringProtocol {
    func masked(_ n: Int = 5, reversed: Bool = false) -> String {
        let mask = String(repeating: "•", count: Swift.max(0, count-n))
        return reversed ? mask + suffix(n) : prefix(n) + mask
    }
    
    var data: Data { .init(utf8) }
    var bytes: [UInt8] { .init(utf8) }
    
}

extension Date{
    
    func getTimeOffset() -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "ZZZZZ"
        return dateFormatterPrint.string(from: self)
    }
    
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    
    func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
