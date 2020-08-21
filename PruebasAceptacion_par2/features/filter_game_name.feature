# language: en

Feature: Search games by name, rating , study | students are Francesca Man Ging - Danny Rios - Brenda Bermello - Jonathan Quintana - Karla Burgos 

  @gamesByName
  Scenario: Filter games that contain the word 'The' in their name
      Given a set of games
     | NAME                       | RELEASE DATE | DEVELOPER            | RATE   |
     | The Witcher 3: Wild Hunt   | 2015         | CD Projekt           | M      |
     | Splatoon                   | 2016         | Nintendo             | T      |
     | Super Smash Bros. Ultimate | 2018         | Bandai Namco Studios | E      |
     | The Last of Us             | 2013         | Naughty Dog          | M      |
      Given the user enters the name: The
      When the user search games by name
      Then 2 games will match
      And the names of these games are
      | NAME                       |
      | The Witcher 3: Wild Hunt   |
      | The Last of Us             |
      And the following message is displayed: 2 games were found containing the word: The


  @gamesByName
  Scenario: Filter games by name without finding result
      Given a set of games
     | NAME                       | RELEASE DATE | DEVELOPER            | RATE   |
     | The Witcher 3: Wild Hunt   | 2015         | CD Projekt           | M      |
     | Splatoon                   | 2016         | Nintendo             | T      |
     | Super Smash Bros. Ultimate | 2018         | Bandai Namco Studios | E      |
     | The Last of Us             | 2013         | Naughty Dog          | M      |
      Given the user enters the name: 'xyz'
      When the user search games by name
      Then 0 games will match
      And the following message is displayed: No game with the specified name was found.



  @gamesByRating
  Scenario: Find games by type of audience with M rating
      Given a set of games
     | NAME                       | RELEASE DATE | DEVELOPER            | RATE   |
     | The Witcher 3: Wild Hunt   | 2015         | CD Projekt           | M      |
     | Splatoon                   | 2016         | Nintendo             | T      |
     | Super Smash Bros. Ultimate | 2018         | Bandai Namco Studios | E      |
     | The Last of Us             | 2013         | Naughty Dog          | M      |
      Given the user enters the rating: M
      When the user search games by rating
      Then 2 games will match
      And the names of these games are
        | NAME                       |
        | The Witcher 3: Wild Hunt   |
        | The Last of Us             |
      And the following message is displayed: 2 games were found.

  @gamesByRating
  Scenario: Find games by type of audience with no result
      Given a set of games
     | NAME                       | RELEASE DATE | DEVELOPER            | RATE   |
     | The Witcher 3: Wild Hunt   | 2015         | CD Projekt           | M      |
     | Splatoon                   | 2016         | Nintendo             | T      |
     | The Last of Us             | 2013         | Naughty Dog          | M      |
      Given the user enters the rating: E
      When the user search games by rating
      Then 0 games will match
      And the following message is displayed: No game with the specified rating was found.




  @gamesByStudy
  Scenario: Find games by study with Nintendo
      Given a set of games
     | NAME                       | RELEASE DATE | DEVELOPER            | RATE   |
     | The Witcher 3: Wild Hunt   | 2015         | CD Projekt           | M      |
     | Splatoon                   | 2016         | Nintendo             | T      |
     | Super Smash Bros. Ultimate | 2018         | Bandai Namco Studios | E      |
     | The Last of Us             | 2013         | Naughty Dog          | M      |
      Given the user enters the study: Nintendo
      When the user search games by study
      Then 1 games will match
      And the names of these games are
        | NAME                       |
        | Splatoon                   |
      And the following message is displayed: A game developed by Nintendo was found.


  @gamesByStudy
  Scenario: Find games by study with no matches
      Given a set of games
     | NAME                       | RELEASE DATE | DEVELOPER            | RATE   |
     | The Witcher 3: Wild Hunt   | 2015         | CD Projekt           | M      |
     | Splatoon                   | 2016         | Nintendo             | T      |
     | Super Smash Bros. Ultimate | 2018         | Bandai Namco Studios | E      |
     | The Last of Us             | 2013         | Naughty Dog          | M      |
      Given the user enters the study: Tencent
      When the user search games by study
      Then 0 games will match
      And the following message is displayed: No game developed by Tencent found