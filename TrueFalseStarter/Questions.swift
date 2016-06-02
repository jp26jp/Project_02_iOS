//
//  Questions.swift
//  TrueFalseStarter
//
//  Created by John R Perry on 5/30/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//


class Question {
    let question: String
    let option01: String
    let option02: String
    let option03: String
    let option04: String
    let answer: String
    init(question: String, option01: String, option02: String, option03: String, option04: String, answer: String) {
        self.question = question
        self.option01 = option01
        self.option02 = option02
        self.option03 = option03
        self.option04 = option04
        self.answer = answer
    }
}

let question01 = Question(question  : "This was the only US President to serve more than two consecutive terms.",
                          option01  : "George Washington",
                          option02  : "Franklin D. Roosevelt",
                          option03  : "Woodrow Wilson",
                          option04  : "Andrew Jackson",
                          answer    : "Franklin D. Roosevelt")

let question02 = Question(question  : "Which of the following countries has the most residents?",
                          option01  : "Nigeria",
                          option02  : "Russia",
                          option03  : "Iran",
                          option04  : "Vietnam",
                          answer    : "Nigeria")

let question03 = Question(question  : "In what year was the United Nations founded?",
                          option01  : "1918",
                          option02  : "1919",
                          option03  : "1945",
                          option04  : "1954",
                          answer    : "1945")

let question04 = Question(question  : "The Titanic departed from the United Kingdom, where was it supposed to arrive?",
                          option01  : "Paris",
                          option02  : "Washington D.C.",
                          option03  : "New York City",
                          option04  : "Boston",
                          answer    : "New York City")

let question05 = Question(question  : "Which nation produces the most oil?",
                          option01  : "Iran",
                          option02  : "Iraq",
                          option03  : "Brazil",
                          option04  : "Canada",
                          answer    : "Canada")

let question06 = Question(question  : "Which country has most recently won consecutive World Cups in Soccer?",
                          option01  : "Italy",
                          option02  : "Brazil",
                          option03  : "Argetina",
                          option04  : "Spain",
                          answer    : "Brazil")

let question07 = Question(question  : "Which of the following rivers is longest?",
                          option01  : "Yangtze",
                          option02  : "Mississippi",
                          option03  : "Congo",
                          option04  : "Mekong",
                          answer    : "Mississippi")

let question08 = Question(question  : "Which city is the oldest?",
                          option01  : "Mexico City",
                          option02  : "Cape Town",
                          option03  : "San Juan",
                          option04  : "Sydney",
                          answer    : "Mexico City")

let question09 = Question(question  : "Which country was the first to allow women to vote in national elections?",
                          option01  : "Poland",
                          option02  : "United States",
                          option03  : "Sweden",
                          option04  : "Senegal",
                          answer    : "Poland")

let question10 = Question(question  : "Which of these countries won the most medals in the 2012 Summer Games?",
                          option01  : "France",
                          option02  : "Germany",
                          option03  : "Japan",
                          option04  : "Great Britian",
                          answer    : "Great Britian")

let allQuestions = [question01, question02, question03, question04, question05, question06, question07, question08, question09, question10]