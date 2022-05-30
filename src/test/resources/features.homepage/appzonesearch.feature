Feature: AppZone Search
  Peter wants to develop an app
  using LTA app services
  Peter wants to search to explore multilingual apps

  # TODO:
  #- condense steps into intent
  #- split into multiple scenarios
  # Taking a user-flow and finding out what are the business Rules and then expanding on each of these Rules
  # using examples

  Scenario Outline: search multilingual apps
    Given Peter is at AppZone page
    When he selects the platform "<platform>"
    And he selects the language "<language>"
    And he enters the search keyword "<keyword>"
    Then he can see the app "<app>"
    And he select the app "<app>"
    Then he can see the supported languages "<language>" on the left panel

    Examples:
    | platform    |language | keyword     |app    |
    | iOs(Apple)  |Chinese  | grab        |grab   |

    Rule: Users can search for apps by name

      Scenario Outline: Searching by keyword
        Given Peter is at the AppZone Page
        When he searches for apps by keyword "<keyword>"
        Then he should be presented with the <apps> applications
        Examples:
        |keyword          | apps                                        | notes                                     |
        | MyTransport.SG  | MyTransport.SG                              | Entering the complete name of the app     |
        | blue            | blueSG                                      | Partial Match                             |
        | buses           | Buses for Singapore Transit, Singapore Bus  | Mutiple matches                           |
        | xyz             |                                             | No matches                                |

  Rule: Users can filter apps by platform and by language
  Scenario Outline: Searching by language
    Given Peter is at the AppZone Page
    When he searches for apps in language <language>
    Then every app presented should display the language symbol "<language symbol>"
    Examples:
      |language | language symbol |
      | English | EN              |
      | Chinese |                 |
      | Malay   | BM              |

    Scenario Outline: Searching by platform
      Given Peter is at the AppZone Page
      When he searches for apps that run on platform "<platform>"
      Then he should be presented with the <apps> applications
      Examples:
        |platform           | apps                        |
        | Andriod (Google)  | Anywheel, Buses.SG, Grab    |
        | iOS (Apple)       | Anywheel, Buses.SG, Grab    |
        | Web Browser       | Moovit                      |

      Rule: Users can view application details
        Scenario Outline: Searching by platform
          Given Peter is at the AppZone Page
          And Peter has searched by keyword "Grab"
          When he selects the Grab App
          Then he should be presented with the following application details:
          | Supported Languages     | Platform                      | Company Name|
          | English, Chinese, Malay | Andriod (Google), iOS (Apple) | Grab Holdings|

