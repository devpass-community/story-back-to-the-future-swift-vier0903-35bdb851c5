import Foundation

extension Date {
    
    func dateAfter(years: Int) -> Date? {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(byAdding: .year, value: years, to: self)
    }
    
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: self)
    }
}
