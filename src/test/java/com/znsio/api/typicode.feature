@prod
Feature: Fetch User Posts and Albums

  Background:
    * def expectedTemplate = read('classpath:com/znsio/templates/schema.json')

  @post
  Scenario Outline: User Should be able to Fetch all Posts of UserId
    Given def userPosts = karate.call('classpath:com/znsio/templates/typicodeTemplates.feature@t_getPosts', { 'userId' : <userId>, 'expectedStatus' : <status> }).response
    Then karate.log("User Posts Length: " + userPosts.length)
    And match each userPosts == <expectedSchema>
    Examples:
    | userId  | status  | expectedSchema |
    | 1       | 200     | expectedTemplate.expectedPostsResponse  |
    | 999     | 200     | expectedTemplate.negativeResponse       |
    | ""      |200      | expectedTemplate.negativeResponse       |

  @album
  Scenario Outline: User Should be able to Fetch all Albums of UserId
    Given def userAlbums = karate.call('classpath:com/znsio/templates/typicodeTemplates.feature@t_getAlbums', { 'userId' : <userId>, expectedStatus : <status> }).response
    Then karate.log("User Albums Length: " + userAlbums.length)
    And match each userAlbums == <expectedSchema>
    Examples:
    | userId  | status  | expectedSchema  |
    | 1       | 200     | expectedTemplate.expectedAlbumResponse  |
    | 999     | 200     | expectedTemplate.negativeResponse       |
    | ""      | 200     | expectedTemplate.negativeResponse       |
