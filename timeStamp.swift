   func createTimeStamp() -> Double {
      let timeStamp = NSDate.timeIntervalSinceReferenceDate
      return timeStamp
   }
   
   func convertTimeStampToDate(timeStamp: Double){
      let date = Date(timeIntervalSinceReferenceDate: timeStamp)
   }
