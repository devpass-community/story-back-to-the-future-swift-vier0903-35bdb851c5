import XCTest
@testable import BackToTheFutureApp

class DateExtensionsTests: XCTestCase {
    
    func testDateAfter() throws {
        
        var dateComponents = DateComponents()
        dateComponents.year = 2023
        dateComponents.month = 1
        dateComponents.day = 31
        
        let date = Calendar.current.date(from: dateComponents)!
        
        let futureDate = date.dateAfter(years: 1000)!
        let year = Calendar.current.component(.year, from: futureDate)
        
        XCTAssertEqual(year, 3023)
    }
    
    func testFormattedDate() throws {
        
        var dateComponents = DateComponents()
        dateComponents.year = 2023
        dateComponents.month = 1
        dateComponents.day = 31
        
        let date = Calendar.current.date(from: dateComponents)!
        let formattedDate = date.formattedDate()
        
        XCTAssertEqual(formattedDate, "31/01/2023")
    }
}
