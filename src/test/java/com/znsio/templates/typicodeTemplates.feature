@template
Feature: API tests for Typicode

  Background:
    * print "Setting up Background"
    Given url env.typicodeUrl
    * print "Url is: "+ env.typicodeUrl

  @t_getPosts
  Scenario: Get List of Posts
    * def uId = userId
    Given path '/posts'
    And param userId = uId
    When method get
    Then status 200
    And print response.length
    And def userPosts = response

  @t_getComments
  Scenario: Get List of Comments
    * def pId = postId
    Given path '/comments'
    And param postId = pId
    When method get
    Then status 200
    And print response.length
    And def userComments = response