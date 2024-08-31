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

func lastCharisDigit(str: String) -> Bool {
    return "0123456789".contains(getlastCharOrEmptyOf(str: str))
}

func lastCharisDigitOrPercent(str: String) -> Bool {
    return "0123456789%".contains(getlastCharOrEmptyOf(str: str))
}

func lastCharacterIsAnOperator(str: String) -> Bool {
    let lastChar = getlastCharOrEmptyOf(str: str)
    return operators.contains(lastChar)
}
