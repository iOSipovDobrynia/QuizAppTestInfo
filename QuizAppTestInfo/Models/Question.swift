//
//  Question.swift
//  QuizAppTestInfo
//
//  Created by Goodwasp on 06.08.2023.
//

struct Question {
    let title: String
    let responseType: ResponseType
    let answers: [Answer]
    
    static func getQuestions() -> [Question] {
        [
            Question(
                title: "Какую атмосферу вы хотите создать",
                responseType: .single,
                answers: [
                    Answer(title: "Соперничество", game: .alias),
                    Answer(title: "Дикий Запад", game: .bang),
                    Answer(title: "Случайность", game: .bombCats),
                    Answer(title: "Нуар", game: .mafia)
                ]
            ),
            Question(
                title: "Выберите верные варианты",
                responseType: .multiple,
                answers: [
                    Answer(title: "На время", game: .alias),
                    Answer(title: "Карточная +", game: .bang),
                    Answer(title: "Один победитель", game: .bombCats),
                    Answer(title: "Карточная", game: .mafia)
                ]
            ),
            Question(
                title: "Как вы относитесь к огнестрельному оружию",
                responseType: .ranged,
                answers: [
                    Answer(title: "Отрицательно", game: .alias),
                    Answer(title: "", game: .bang),
                    Answer(title: "", game: .bombCats),
                    Answer(title: "Это моя жизнь", game: .mafia)
                ]
            )
        ]
    }
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

struct Answer {
    let title: String
    let game: Game
}

enum Game: Character {
    case alias = "🤓"
    case bombCats = "😼"
    case bang = "🤠"
    case mafia = "🥷"
    
    var definition: String {
        switch self {
        case .alias:
            return "цель игроков — объяснять друг другу слова"
        case .bombCats:
            return "Милые пушистики смертельно опасны!"
        case .bang:
            return "Дикий Запад не просто так называют диким, ведь на нём творятся воистину дикие вещи в самых диких проявлениях дикости :)"
        case .mafia:
            return "клубная командная психологическая пошаговая ролевая игра с детективным сюжетом, моделирующая борьбу информированных друг о друге членов организованного меньшинства с неорганизованным большинством."
        }
    }
}

