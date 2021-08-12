//
//  QuestionService.swift
//  QuizGame
//
//  Created by Denis Kuzmin on 12.08.2021.
//

import Foundation

class QuestionService {
    static func getQuestions() -> [Question] {
        [
            Question(question: "Как называется небольшой магазинчик с одеждой супер-класса?",
                 answers: ["Бутик","Батик","Батник","Битник"], friendAnswer: "Батник", spectatorsOpinion: 0),
            Question(question: "Как называется государственное денежное пособие студентам?",
                     answers: ["Стипендия","Аванс","Подаяние","Воспомоществование"], friendAnswer: "Стипендия", spectatorsOpinion: 0),
            Question(question: "Кому А. С. Пушкин посвятил стихотворение \"Во глубине сибирских руд …\"?",
                 answers: ["Декабристам","Пугачёву","Лермонтову","Гоголю"], friendAnswer: "Декабристам", spectatorsOpinion: 0),
            Question(question: "Какой из этих крепких спиртных напитков изготовлен из яблок?",
                 answers: ["Кальвадос","Текила","Саке","Ром"], friendAnswer: "Кальвадос", spectatorsOpinion: 1),
            Question(question: "Как заметил Станислав Ежи Лец: «Истинный эксгибиционизм состоит в показывании того, ...»",
                 answers: ["Чего нет","Что есть","Что можно показывать","Чего нельзя показывать"], friendAnswer: "Чего нет", spectatorsOpinion: 2),
            Question(question: "От чего в 1890 году законодательно отказалась Юта, чтобы стать полноправным штатом США?",
                 answers: ["Многожёнство","Употребление алкоголя","Суд Линча","Рабовладение"], friendAnswer: "Рабовладение", spectatorsOpinion: 1),
            Question(question: "Богом какого пантеона был Осирис",
                 answers: ["Египетского","Шумерского","Иудейского","Асирицского"], friendAnswer: "Шумерского", spectatorsOpinion: 0),
            Question(question: "Какое из этих слов написано неправильно?",
                 answers: ["Бижютерия","Жюри","Парашют","Брошюра"], friendAnswer: "Жюри", spectatorsOpinion: 0),
            Question(question: "Какая из этих команд чаще побеждала в кубке конструкторов Формулы-1?",
                 answers: ["Феррари","Ред Булл","Виллиамс","МакЛарен"], friendAnswer: "Феррари", spectatorsOpinion: 3),
            Question(question: "Как назывался сборник законов Древнерусского государства?",
                 answers: ["Русская правда","Судебник","Повесть временных лет","Соборное уложение"], friendAnswer: "Не знаю, пусть будет первый вариант", spectatorsOpinion: 1),
        ]
    }
}
