/*
 Input: [["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]]
 
 dic
 key     value
 MUC     LHR
 JFK     MUC
 SFO     SJC
 LHR     SFO
 
 var result = [jfk]
 so start from JFK
 append keys ... jfk, muc
 muc as key ... jfk, muc, LHR
 LHR as key ... JFK, MUC, LHR, SFO
 SFO as key ... [JFK, MUC, LHR, SFO, SJC]
 
 return [JFK, MUC, LHR, SFO, SJC]
 
 
 Input: [["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]
 
 dic
 key     value
 JFK     [SFO, ATL]
 SFO     [ATL]
 ATL     [JFK, SFO]
 
 sort values of each key to make lexical
 dic
 key     value
 JFK     [ATL, SFO]
 SFO     [ATL]
 ATL     [JFK, SFO]
 do same as above
 
 init routeDic -- maybe with JFK
 init res array with JFK
 
 for loop through tickets and build the graph in the dictionary
 
 start from JFK and go till the end
 */

class Solution {
    func findItinerary(_ tickets: [[String]]) -> [String] {
        var routeDic = [String:[String]]()
        var res = ["JFK"]
        
        // build graph
        for ticket in tickets {
            if var val = routeDic[ticket[0]] {
                val.append(ticket[1])
                routeDic[ticket[0]] = val
            } else {
                routeDic[ticket[0]] = [ticket[1]]
            }
        }
        
        print(routeDic)
        
        
        
        for (key,values) in routeDic {
            let sortedVal = values.sorted()
            routeDic[key] = sortedVal
        }
        
        print(routeDic)
        
        // while !routeDic.isEmpty {
        //     let key = res.last!
        //     if var destenations = routeDic[key] {
        //         res.append(destenations.removeFirst())
        //         if destenations.isEmpty {
        //             routeDic[key] = nil
        //         } else {
        //             routeDic[key] = destenations
        //         }
        //     }
        // }
        
        return res
    }
}
