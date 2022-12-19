@prod
Feature: Fetch User Posts and Albums

  Background:
    * def expectedPostsTemplate = read('classpath:com/znsio/templates/fetchPostSchema.json')
    * def expectedAlbumsTemplate = read('classpath:com/znsio/templates/fetchAlbumSchema.json')

  @post
  Scenario Outline: User Should be able to Fetch all Posts of UserId
    Given def userPosts = karate.call('classpath:com/znsio/templates/typicodeTemplates.feature@t_getPosts', { 'userId' : <userId>, 'expectedStatus' : <status> }).response
    Then karate.log("User Posts Length: " + userPosts.length)
    And match each userPosts == <expectedSchema>
    Examples:
    | userId                              | status  | expectedSchema                                |
    | generateAlphaNumericRandomString(7) | 200     | expectedPostsTemplate.negativeResponse        |
    | 1                                   | 200     | expectedPostsTemplate.expectedPostsResponse   |
    | 999                                 | 200     | expectedPostsTemplate.negativeResponse        |
    | ""                                  | 200     | expectedPostsTemplate.negativeResponse        |

  @album
  Scenario Outline: User Should be able to Fetch all Albums of UserId
    Given def userAlbums = karate.call('classpath:com/znsio/templates/typicodeTemplates.feature@t_getAlbums', { 'userId' : <userId>, expectedStatus : <status> }).response
    Then karate.log("User Albums Length: " + userAlbums.length)
    And match each userAlbums == <expectedSchema>
    Examples:
    | userId                              | status  | expectedSchema                                |
    | generateAlphaNumericRandomString(7) | 200     | expectedAlbumsTemplate.negativeResponse       |
    | 1                                   | 200     | expectedAlbumsTemplate.expectedAlbumResponse  |
    | 999                                 | 200     | expectedAlbumsTemplate.negativeResponse       |
    | ""                                  | 200     | expectedAlbumsTemplate.negativeResponse       |