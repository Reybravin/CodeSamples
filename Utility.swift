class Utility {
    
    private let _dateFormatter: DateFormatter
    private let _moneyFormatter: NumberFormatter
    
    static let shared = Utility()
    
    private init() {
        _dateFormatter = DateFormatter()
        _dateFormatter.dateFormat = "dd-MM-yyyy"
        _dateFormatter.locale = Locale.current
        
        _moneyFormatter = NumberFormatter()
        _moneyFormatter.currencySymbol = "£"
        _moneyFormatter.maximumFractionDigits = 2
        _moneyFormatter.minimumFractionDigits = 2
        _moneyFormatter.numberStyle = .currency
    }
    
    var dateFormatter: DateFormatter { // "dd-MM-yyyy"
        return _dateFormatter
    }
    
    var moneyFormatter : NumberFormatter {
        return _moneyFormatter
    }
    
}

func executeOnBackgroundThread(_ clouser: @escaping ()->()) {
    if Thread.isMainThread {
        DispatchQueue.global().async(execute: clouser)
    } else {
        clouser()
    }
}

func executeOnMainThread(_ clouser: @escaping ()->()) {
    if Thread.isMainThread {
        clouser()
    } else {
        DispatchQueue.main.async(execute: clouser)
    }
}
