import Foundation


func getlastCharOrEmptyOf(str: String) -> String {
    return str.isEmpty ? "" : String(str.last!)
}

func lastCharacterIsEqualTo(str: String, char: String) -> Bool {
    let last = getlastCharOrEmptyOf(str: str)
    return last == char
}

func formatResult(value: Double) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 16
    return numberFormatter.string(from: NSNumber(value: value)) ?? "0"
}
