import Foundation

func formatDuration(_ time: Int) -> String {
    var seconds: Int = 0
    var minutes: Int = 0
    var hours: Int = 0
    var days: Int = 0
    var years: Int = 0
    
    if time > 0 {
        guard time / 60 >= 1 else {
            return printTime(time, minutes, hours, days, years)
        }
        seconds = time % 60
        minutes = Int(floor(Double(time) / 60))
        
        guard minutes / 60 >= 1 else {
            return printTime(seconds, minutes, hours, days, years)
        }
        hours = Int(floor(Double(minutes) / 60))
        minutes %= 60
        
        guard hours / 24 >= 1 else {
            return printTime(seconds, minutes, hours, days, years)
        }
        days = Int(floor(Double(hours) / 24))
        hours %= 24
        
        guard days / 365 >= 1 else {
            return printTime(seconds, minutes, hours, days, years)
        }
        years = Int(floor(Double(days) / 365))
        days %= 365
        
        return printTime(seconds, minutes, hours, days, years)
    } else {
        return "now"
    }
}

func printTime(_ seconds: Int, _ minutes: Int, _ hours: Int, _ days: Int, _ years: Int) -> String {
    let times: [Int] = [seconds, minutes, hours, days, years]
    
    var timesWritten: [String] = []
    timesWritten.append("\(seconds) second")
    timesWritten.append("\(minutes) minute")
    timesWritten.append("\(hours) hour")
    timesWritten.append("\(days) day")
    timesWritten.append("\(years) year")
    
    var timesWritten2: [String] = []
    
    for i in 0..<times.count {
        if times[i] > 1 {
            timesWritten[i].append("s")
        }
        if times[i] != 0 {
            timesWritten2.append(timesWritten[i])
        }
    }
    print(timesWritten2)
    
    var result: String = ""
    
    if timesWritten2.count > 1  {
        timesWritten2[0] = " and " + timesWritten2[0]
    } else if timesWritten2.count == 2 {
        timesWritten2[2].append(" ")
    }
    
    if timesWritten2.count > 2 {
        for i in 2..<timesWritten2.count {
            timesWritten2[i].append(", ")
        }
    }
    
    timesWritten2.reverse()
    
    for item in timesWritten2 {
        result.append(item)
    }
    
    return result
}

func betterFormatDuration(_ seconds: Int) -> String {
    guard seconds > 0 else { return "now" }
    
    var unit = ["year", "day", "hour", "minute", "second"],
        unitDuration = [Int.max, 365, 24, 60, 60],
        duration = seconds,
        result = [String](),
        divisor: Int

    while duration > 0 {
        divisor = unitDuration.removeLast()
        
        let r = duration % divisor,
            suffix = r > 1 ? "s" : "",
            str = "\(r) \(unit.removeLast())\(suffix)"
        if r > 0 { result.insert(str, at: 0) }

        duration /= divisor
    }

    return result.count > 1 ?
        result.dropLast().joined(separator: ", ") + " and " + result.last! :
        result.last!
}
