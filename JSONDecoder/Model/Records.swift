//https://app.quicktype.io/


import Foundation

// MARK: - Welcome
struct Records: Codable {
    let person: [Person]
}

// MARK: - Person
struct Person: Codable {
    let name, age, employed: String
    
    //If the keys used in your serialized data format don't match the property names from your data type, provide alternative keys by specifying String as the raw-value type for the CodingKeys
    private enum CodingKeys : String, CodingKey {
        case name, age = "person_age", employed
    }
}
