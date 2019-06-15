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
 use DFS/ Stack to go through values and remove the ones visited
 append to dictionary
 */

/*
 Runtime: 116 ms, faster than 82.89% of Swift online submissions for Reconstruct Itinerary.
 Memory Usage: 21.6 MB, less than 8.89% of Swift online submissions for Reconstruct Itinerary.

 Time: o(N)
 Space: o(N) recrusive stack
 */

class Solution {
    var routeDic = [String:[String]]()
    var route = [String]()
    
    func findItinerary(_ tickets: [[String]]) -> [String] {
        // build graph
        for ticket in tickets {
            if var val = routeDic[ticket[0]] {
                val.append(ticket[1])
                routeDic[ticket[0]] = val
            } else {
                routeDic[ticket[0]] = [ticket[1]]
            }
        }
        
        for (key,values) in routeDic {
            let sortedVal = values.sorted()
            routeDic[key] = sortedVal
        }
        
        visit("JFK")
        
        return route.reversed()
    }
    
    func visit(_ airport: String) {
        if routeDic[airport] != nil {
            while routeDic[airport]!.count > 0 {
                if let nextDestenation = routeDic[airport]!.first {
                    routeDic[airport]!.removeFirst()
                    visit(nextDestenation)
                }
            }
        }
        route.append(airport)
    }
}
