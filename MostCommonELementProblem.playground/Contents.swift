import UIKit

var colorArray = ["red", "green", "black", "blue","yellow","red", "green","yellow","red","red","green","green","grey","purple","orange","grey","blue","red","green","yellow","orange","purple","black","red","blue","green","blue","orange","yellow","white","blue","red","orange","purple","blue","black"]

func getMostCommonColor(array: [String]) -> [String] {
    var topColors: [String] = []
    var colorDictionary: [String: Int] = [:]

    for color in array {
        colorDictionary[color, default: 0] += 1
    }
    let highestValue = colorDictionary.values.max()
    
    topColors = colorDictionary.keys.filter({colorDictionary[$0] == highestValue})
    
    return topColors
}

func getMostCommonColorAnotherSolution(array: [String]) -> String {
    let groupedDictionary = Dictionary(grouping: array, by: {$0})
    let newDictionary = groupedDictionary.mapValues() {$0.count}
    return newDictionary.sorted(by: {$0.value < $1.value}).last?.key ?? ""
}

getMostCommonColor(array: colorArray)
getMostCommonColorAnotherSolution(array: colorArray)
