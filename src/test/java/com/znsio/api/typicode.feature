@prod
Feature: Fetch User Posts and Albums

  Background:
    * def userId = 1
    * def invalidUserId = 999

  @post
  Scenario: User Should be able to Fetch all Posts of UserId 1.
    Given def userPosts = karate.call('classpath:com/znsio/templates/typicodeTemplates.feature@t_getPosts', { 'userId' : userId }).response
    Then karate.log("User Posts Length: " + userPosts.length)
    And assert userPosts.length >= 1
    And match each userPosts..userId == 1
    And match userPosts[0] == read('classpath:com/znsio/templates/schema.json').expectedPostsResponse

  @post
  Scenario: User Should Fetch the Posts with Invalid UserId 999
    Given def userPosts = karate.call('classpath:com/znsio/templates/typicodeTemplates.feature@t_getPosts', { 'userId' : invalidUserId }).response
    Then karate.log("User Posts Length: " + userPosts.length)
    And assert userPosts.length == 0

  @album
  Scenario: User Should be able to Fetch all Albums of UserId 1
    Given def userAlbums = karate.call('classpath:com/znsio/templates/typicodeTemplates.feature@t_getAlbums', { 'userId' : userId }).response
    Then karate.log("User Albums Length: " + userAlbums.length)
    And assert userAlbums.length >= 1
    And match each userAlbums..userId == 1
    And match userAlbums[0] == read('classpath:com/znsio/templates/schema.json').expectedAlbumResponse

  @album
  Scenario: User Should Fetch the Albums with Invalid UserId 999
    Given def userAlbums = karate.call('classpath:com/znsio/templates/typicodeTemplates.feature@t_getAlbums', { 'userId' : invalidUserId }).response
    Then karate.log("User Albums Length: " + userAlbums.length)
    And assert userAlbums.length == 0