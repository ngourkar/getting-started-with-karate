@prod
Feature: API Testing for Typicode on https://jsonplaceholder.typicode.com/

  @post
  Scenario: User Should be able to Fetch all Posts of User 1.
    * def userId = 1
    Given def userPosts = karate.call('classpath:com/znsio/templates/typicodeTemplates.feature@t_getPosts', { 'userId' : userId }).userPosts
    Then print "User Posts Length: " + userPosts.length
    And assert userPosts.length >= 1
    And match each userPosts..userId == 1

  @comment
  Scenario: User Should be able to Fetch all Comments of User 1
    * def postId = 1
    Given def userComments = karate.call('classpath:com/znsio/templates/typicodeTemplates.feature@t_getComments', { 'postId' : postId }).userComments
    Then print "User Comments Length: " + userComments.length
    And assert userComments.length >= 1
    And match each userComments..postId == 1