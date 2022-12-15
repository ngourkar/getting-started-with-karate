@template
Feature: API tests for Get, Update, Create in Typicode

  Background:
    Given url env.typicodeUrl
    * print "Url is: "+ env.typicodeUrl

  @t_getPosts
  Scenario: Get List of Posts
    * def uId = userId
    Given path '/posts'
    And param userId = uId
    When method get
    Then status 200

  @t_getAlbums
  Scenario: Get List of Albums
    * def uId = userId
    Given path '/albums'
    And param userId = uId
    When method get
    Then status 200

  @t_createPost
  Scenario: Create the Post
    Given path '/posts'
    * request {"userId": "#(userId)", "title": "#(title)", "body": "#(body)"}
    When method POST
    Then status 201
    * karate.log("Response after creation: " + response)

  @t_updatePost
  Scenario: Update the Post
    Given path '/posts/' + userId
    * request {"title": "#(title)"}
    When method PUT
    Then status 201
    * karate.log("Response after Updation: " + response)
